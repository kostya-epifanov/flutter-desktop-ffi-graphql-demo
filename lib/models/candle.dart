/// OHLCV candlestick data model.
class Candle {
  const Candle({
    required this.timestamp,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });

  final int timestamp;
  final double open;
  final double high;
  final double low;
  final double close;
  final double volume;

  factory Candle.fromJson(Map<String, dynamic> json) {
    return Candle(
      timestamp: (json['timestamp'] as num).toInt(),
      open: (json['open'] as num).toDouble(),
      high: (json['high'] as num).toDouble(),
      low: (json['low'] as num).toDouble(),
      close: (json['close'] as num).toDouble(),
      volume: (json['volume'] as num).toDouble(),
    );
  }
}
