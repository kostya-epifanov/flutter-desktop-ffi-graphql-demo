import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../domain/candle_repository.dart';
import 'candle.dart';

/// Bitquery GraphQL implementation of [CandleRepository].
class BitqueryCandleRepository implements CandleRepository {
  BitqueryCandleRepository({
    String? apiKey,
    String endpoint = 'https://streaming.bitquery.io/graphql',
  })  : _apiKey = apiKey ?? dotenv.env['BITQUERY_API_KEY'],
        _endpoint = endpoint;

  final String? _apiKey;
  final String _endpoint;

  GraphQLClient? _client;

  static const _ethCurrencyId = 'bid:eth';
  static const _oneHourSeconds = 3600;
  static const _candleLimit = 200;

  static final _ethOhlcvQuery = gql('''
query EthOhlcv {
  Trading {
    Currencies(
      where: {
        Currency: { Id: { is: "$_ethCurrencyId" } },
        Interval: { Time: { Duration: { eq: $_oneHourSeconds } } },
        Volume: { Usd: { gt: 5 } },
        Block: { Time: { since_relative: { days_ago: 14 } } }
      },
      limit: { count: $_candleLimit },
      orderBy: { descending: Block_Time }
    ) {
      Block { Timestamp }
      Volume { Usd }
      Price { Ohlc { Open High Low Close } }
    }
  }
}
''');

  GraphQLClient _getClient() {
    _client ??= _createClient();
    return _client!;
  }

  GraphQLClient _createClient() {
    final apiKey = _requireApiKey();
    final httpLink = HttpLink(_endpoint);
    final authLink = AuthLink(getToken: () async => 'Bearer $apiKey');
    final link = authLink.concat(httpLink);

    return GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }

  String _requireApiKey() {
    final key = _apiKey;
    if (key == null || key.isEmpty || key == 'your_key_here') {
      throw BitqueryException(
        'Bitquery API key not configured. Copy .env.example to .env and set BITQUERY_API_KEY.',
      );
    }
    return key;
  }

  @override
  Future<List<Candle>> fetchEthCandles() async {
    _requireApiKey();

    final result = await _getClient().query(
      QueryOptions(
        document: _ethOhlcvQuery,
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      final ex = result.exception!;
      final msg = ex.graphqlErrors.isNotEmpty
          ? ex.graphqlErrors.first.message
          : (ex.linkException?.toString() ?? ex.toString());
      throw BitqueryException('GraphQL error: $msg');
    }

    final data = result.data;
    if (data == null) {
      throw BitqueryException('No data in response');
    }

    final trading = data['Trading'] as Map<String, dynamic>?;
    if (trading == null) {
      throw BitqueryException('No Trading data in response');
    }

    final currencies = trading['Currencies'] as List<dynamic>?;
    if (currencies == null || currencies.isEmpty) {
      return [];
    }

    final candles = <Candle>[];
    for (final item in currencies) {
      final map = item as Map<String, dynamic>;
      final block = map['Block'] as Map<String, dynamic>?;
      final volume = map['Volume'] as Map<String, dynamic>?;
      final price = map['Price'] as Map<String, dynamic>?;
      final ohlc = price?['Ohlc'] as Map<String, dynamic>?;
      if (block == null || ohlc == null) continue;

      final ts = block['Timestamp'];
      final usd = volume?['Usd'];
      final open = ohlc['Open'];
      final high = ohlc['High'];
      final low = ohlc['Low'];
      final close = ohlc['Close'];
      if (ts == null || open == null || high == null || low == null || close == null) {
        continue;
      }

      candles.add(
        Candle(
          timestamp: (ts is num) ? ts.toInt() : int.parse(ts.toString()),
          open: _toDouble(open),
          high: _toDouble(high),
          low: _toDouble(low),
          close: _toDouble(close),
          volume: _toDouble(usd ?? 0),
        ),
      );
    }

    // API returns descending; we want chronological
    candles.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    return candles;
  }

  double _toDouble(dynamic v) {
    if (v is num) return v.toDouble();
    return double.tryParse(v.toString()) ?? 0.0;
  }
}

/// Thrown when Bitquery API requests fail.
class BitqueryException implements Exception {
  BitqueryException(this.message);

  final String message;

  @override
  String toString() => 'BitqueryException: $message';
}
