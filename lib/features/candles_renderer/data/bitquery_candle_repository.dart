import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../core/graphql/bitquery_graphql_client.dart';
import '../domain/candle_repository.dart';
import 'candle.dart';

/// Bitquery GraphQL implementation of [CandleRepository].
class BitqueryCandleRepository implements CandleRepository {
  BitqueryCandleRepository({BitqueryGraphQLClient? graphqlClient})
      : _client = graphqlClient ?? BitqueryGraphQLClient();

  final BitqueryGraphQLClient _client;

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

  @override
  Future<List<Candle>> fetchEthCandles() async {
    final data = await _client.query(_ethOhlcvQuery);

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
