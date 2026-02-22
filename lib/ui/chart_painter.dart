import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

/// Decodes RGBA pixel buffer (from native render) into a [ui.Image].
Future<ui.Image> rgbaBufferToImage(
  Uint8List pixelData,
  int width,
  int height,
) {
  final completer = Completer<ui.Image>();
  ui.decodeImageFromPixels(
    pixelData,
    width,
    height,
    ui.PixelFormat.rgba8888,
    (ui.Image image) {
      if (!completer.isCompleted) {
        completer.complete(image);
      }
    },
  );
  return completer.future;
}
