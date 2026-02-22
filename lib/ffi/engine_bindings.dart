import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:flutter_desktop_ffi_graphql_demo/ffi/native_candle.dart';
import 'package:flutter_desktop_ffi_graphql_demo/models/candle.dart';

/// Binds to libfinancial_engine.dylib and provides Dart-friendly wrappers
/// with proper memory management.
class FinancialEngine {
  FinancialEngine._(this._calculateEma, this._renderCandles, this._freeBuffer);

  static FinancialEngine? _instance;

  static FinancialEngine get instance {
    _instance ??= _load();
    return _instance!;
  }

  final _CalculateEma _calculateEma;
  final _RenderCandles _renderCandles;
  final _FreeBuffer _freeBuffer;

  static FinancialEngine _load() {
    final path = _resolveDylibPath();
    final dylib = DynamicLibrary.open(path);

    final calculateEma = dylib
        .lookup<NativeFunction<CalculateEmaNative>>('calculate_ema')
        .asFunction<_CalculateEma>();

    final renderCandles = dylib
        .lookup<NativeFunction<RenderCandlesNative>>('render_candles')
        .asFunction<_RenderCandles>();

    final freeBuffer = dylib
        .lookup<NativeFunction<FreeBufferNative>>('free_buffer')
        .asFunction<_FreeBuffer>();

    return FinancialEngine._(calculateEma, renderCandles, freeBuffer);
  }

  static String _resolveDylibPath() {
    if (Platform.isMacOS) {
      final executable = File(Platform.resolvedExecutable);
      final appDir = executable.parent.path;

      // 1. App bundle Frameworks (when built via Xcode / flutter run)
      final frameworksPath = '$appDir/../Frameworks/libfinancial_engine.dylib';
      if (File(frameworksPath).existsSync()) {
        return frameworksPath;
      }

      // 2. Next to executable (alternate bundle layout)
      final nextToExe = '$appDir/libfinancial_engine.dylib';
      if (File(nextToExe).existsSync()) {
        return nextToExe;
      }

      // 3. Project root (dev: run scripts/build_native.sh first)
      final cwd = Directory.current.path;
      final devPath = '$cwd/libfinancial_engine.dylib';
      if (File(devPath).existsSync()) {
        return devPath;
      }

      throw ArgumentError(
        'libfinancial_engine.dylib not found. Run scripts/build_native.sh first.',
      );
    }
    throw UnsupportedError('Only macOS is supported');
  }

  /// Calculates EMA for the given close prices.
  /// Returns a list of length equal to prices.
  List<double> calculateEma(List<double> prices, int period) {
    if (prices.isEmpty || period <= 0 || period > prices.length) {
      return List.filled(prices.length, 0.0);
    }

    final ptr = prices.allocate();
    try {
      final resultPtr = _calculateEma(ptr, prices.length, period);
      if (resultPtr == nullptr) {
        return List.filled(prices.length, 0.0);
      }
      try {
        return resultPtr.asTypedList(prices.length).toList();
      } finally {
        _freeBuffer(resultPtr.cast());
      }
    } finally {
      ptr.freeAllocated(prices);
    }
  }

  /// Renders candlesticks to an RGBA buffer.
  /// If [ema] is provided and has the same length as candles, draws the EMA line overlay.
  /// Returns a Uint8List that the caller owns (copied from native buffer).
  Uint8List renderCandles(List<Candle> candles, int width, int height, {List<double>? ema}) {
    if (candles.isEmpty || width <= 0 || height <= 0) {
      return Uint8List(0);
    }

    final ptr = _allocateCandles(candles);
    try {
      Pointer<Double>? emaPtr;
      int emaCount = 0;
      if (ema != null && ema.length == candles.length) {
        emaPtr = ema.allocate();
        emaCount = ema.length;
      }

      try {
        final bufferPtr = _renderCandles(
          ptr,
          candles.length,
          width,
          height,
          emaPtr ?? Pointer<Double>.fromAddress(0),
          emaCount,
        );
        if (bufferPtr == nullptr) {
          return Uint8List(0);
        }
        try {
          final size = width * height * 4;
          return Uint8List.fromList(bufferPtr.asTypedList(size));
        } finally {
          _freeBuffer(bufferPtr.cast());
        }
      } finally {
        if (emaPtr != null) {
          emaPtr.freeAllocated(ema!);
        }
      }
    } finally {
      _freeCandles(ptr, candles.length);
    }
  }

  Pointer<NativeCandle> _allocateCandles(List<Candle> candles) {
    final ptr = calloc<NativeCandle>(candles.length);
    for (var i = 0; i < candles.length; i++) {
      final native = (ptr + i).ref;
      native.timestamp = candles[i].timestamp;
      native.open = candles[i].open;
      native.high = candles[i].high;
      native.low = candles[i].low;
      native.close = candles[i].close;
      native.volume = candles[i].volume;
    }
    return ptr;
  }

  void _freeCandles(Pointer<NativeCandle> ptr, int count) {
    calloc.free(ptr);
  }
}

// Native function typedefs
typedef CalculateEmaNative =
    Pointer<Double> Function(Pointer<Double> prices, Int32 length, Int32 period);
typedef _CalculateEma = Pointer<Double> Function(Pointer<Double> prices, int length, int period);

typedef RenderCandlesNative =
    Pointer<Uint8> Function(
      Pointer<NativeCandle> candles,
      Int32 count,
      Int32 width,
      Int32 height,
      Pointer<Double> ema,
      Int32 emaCount,
    );
typedef _RenderCandles =
    Pointer<Uint8> Function(
      Pointer<NativeCandle> candles,
      int count,
      int width,
      int height,
      Pointer<Double> ema,
      int emaCount,
    );

typedef FreeBufferNative = Void Function(Pointer<Void> ptr);
typedef _FreeBuffer = void Function(Pointer<Void> ptr);

// Helpers for double array allocation
extension _DoubleListAlloc on List<double> {
  Pointer<Double> allocate() {
    final ptr = calloc<Double>(length);
    for (var i = 0; i < length; i++) {
      (ptr + i).value = this[i];
    }
    return ptr;
  }
}

extension _DoublePointerFree on Pointer<Double> {
  void freeAllocated(List<double> _) {
    calloc.free(this);
  }
}
