import '../../models/candle.dart';

/// Port for fetching OHLCV candle data.
abstract class CandleRepository {
  /// Fetches last 200 ETH 1h candles.
  Future<List<Candle>> fetchEthCandles();
}
