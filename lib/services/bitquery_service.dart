import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/candle.dart';

/// Fetches OHLCV candle data from Bitquery GraphQL Crypto Price API.
class BitqueryService {
  BitqueryService({
    String? apiKey,
    String endpoint = 'https://streaming.bitquery.io/graphql',
  })  : _apiKey = apiKey ?? dotenv.env['BITQUERY_API_KEY'],
        _endpoint = endpoint;

  final String? _apiKey;
  final String _endpoint;

  static const _ethCurrencyId = 'bid:eth';
  static const _oneHourSeconds = 3600;
  static const _candleLimit = 200;

  /// Fetches last 200 ETH 1h candles.
  Future<List<Candle>> fetchEthCandles() async {
    final apiKey = _apiKey;
    if (apiKey == null || apiKey.isEmpty || apiKey == 'your_key_here') {
      throw BitqueryException(
        'Bitquery API key not configured. Copy .env.example to .env and set BITQUERY_API_KEY.',
      );
    }

    const query = '''
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
''';

    final response = await http.post(
      Uri.parse(_endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({'query': query}),
    );

    if (response.statusCode != 200) {
      throw BitqueryException(
        'HTTP ${response.statusCode}: ${response.reasonPhrase ?? response.body}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final errors = json['errors'];
    if (errors != null) {
      final msg = errors is List && errors.isNotEmpty
          ? (errors[0] as Map)['message']?.toString() ?? errors.toString()
          : errors.toString();
      throw BitqueryException('GraphQL error: $msg');
    }

    final data = json['data'] as Map<String, dynamic>?;
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

      candles.add(Candle(
        timestamp: (ts is num) ? ts.toInt() : int.parse(ts.toString()),
        open: _toDouble(open),
        high: _toDouble(high),
        low: _toDouble(low),
        close: _toDouble(close),
        volume: _toDouble(usd ?? 0),
      ));
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

class BitqueryException implements Exception {
  BitqueryException(this.message);
  final String message;
  @override
  String toString() => 'BitqueryException: $message';
}
