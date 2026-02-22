import '../../../core/graphql/bitquery_graphql_client.dart';
import '../../../core/graphql/queries/eth_ohlcv.graphql.dart';
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
  static const _daysAgo = 14;

  @override
  Future<List<Candle>> fetchEthCandles() async {
    final variables = Variables$Query$EthOhlcv(
      currencyId: _ethCurrencyId,
      duration: _oneHourSeconds,
      limit: _candleLimit,
      daysAgo: _daysAgo,
    );

    final data = await _client.query(
      documentNodeQueryEthOhlcv,
      variables: variables.toJson(),
    );

    final parsed = Query$EthOhlcv.fromJson(data);
    final trading = parsed.Trading;
    if (trading == null) {
      throw BitqueryException('No Trading data in response');
    }

    final currencies = trading.Currencies;
    if (currencies == null || currencies.isEmpty) {
      return [];
    }

    final candles = <Candle>[];
    for (final item in currencies) {
      final currency = item;
      if (currency == null) continue;

      final block = currency.Block;
      final ohlc = currency.Price?.Ohlc;
      if (block == null || ohlc == null) continue;

      final ts = block.Timestamp;
      final usd = currency.Volume?.Usd;
      final open = ohlc.Open;
      final high = ohlc.High;
      final low = ohlc.Low;
      final close = ohlc.Close;
      if (ts == null || open == null || high == null || low == null || close == null) {
        continue;
      }

      candles.add(
        Candle(
          timestamp: ts.toInt(),
          open: open,
          high: high,
          low: low,
          close: close,
          volume: usd ?? 0,
        ),
      );
    }

    // API returns descending; we want chronological
    candles.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    return candles;
  }
}
