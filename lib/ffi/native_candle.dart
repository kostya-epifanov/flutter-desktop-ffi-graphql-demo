import 'dart:ffi';

/// FFI struct that mirrors the C Candle layout.
/// All fields are 8-byte aligned, matching the native ABI.
base class NativeCandle extends Struct {
  @Int64()
  external int timestamp;

  @Double()
  external double open;

  @Double()
  external double high;

  @Double()
  external double low;

  @Double()
  external double close;

  @Double()
  external double volume;
}
