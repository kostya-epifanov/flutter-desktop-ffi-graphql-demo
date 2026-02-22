import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/candles_renderer/data/bitquery_candle_repository.dart';
import 'features/candles_renderer/presentation/chart_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Surface uncaught Flutter/Dart errors to console when running from terminal
  FlutterError.onError = (details) {
    debugPrint('FlutterError: ${details.exception}');
    debugPrint('Stack: ${details.stack}');
    FlutterError.presentError(details);
  };
  WidgetsBinding.instance.platformDispatcher.onError = (error, stack) {
    debugPrint('Uncaught error: $error');
    debugPrint('Stack: $stack');
    return true;
  };

  await dotenv.load(fileName: '.env');

  // macOS window configuration
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ETH Native FFI Chart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(primary: Colors.teal, surface: const Color(0xFF1a1a2e)),
      ),
      home: ChartScreen(candleRepository: BitqueryCandleRepository()),
    );
  }
}
