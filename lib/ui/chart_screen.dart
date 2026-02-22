import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../ffi/engine_bindings.dart';
import '../models/candle.dart';
import '../services/bitquery_service.dart';
import 'chart_painter.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  List<Candle> _candles = [];
  ui.Image? _chartImage;
  bool _loading = true;
  String? _error;
  int _emaPeriod = 21;
  static const _emaOptions = [9, 21, 50];
  static const _chartWidth = 1200;
  static const _chartHeight = 600;

  final BitqueryService _bitquery = BitqueryService();
  final FinancialEngine _engine = FinancialEngine.instance;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final candles = await _bitquery.fetchEthCandles();
      if (!mounted) return;
      _candles = candles;
      _renderChart();
    } catch (e, stackTrace) {
      debugPrint('Bitquery fetch error: $e');
      debugPrint('Stack trace: $stackTrace');
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  void _renderChart() {
    if (_candles.isEmpty) {
      setState(() {
        _chartImage = null;
        _loading = false;
      });
      return;
    }
    final buffer =
        _engine.renderCandles(_candles, _chartWidth, _chartHeight);
    rgbaBufferToImage(buffer, _chartWidth, _chartHeight).then((image) {
      if (!mounted) return;
      setState(() {
        _chartImage?.dispose();
        _chartImage = image;
        _loading = false;
      });
    });
  }

  @override
  void dispose() {
    _chartImage?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a2e),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildControls(),
            Expanded(
              child: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Text(
            'ETH Native FFI Chart',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 24),
          DropdownButton<int>(
            value: _emaPeriod,
            dropdownColor: const Color(0xFF2a2a3e),
            style: const TextStyle(color: Colors.white),
            items: _emaOptions
                .map((p) => DropdownMenuItem(value: p, child: Text('EMA $p')))
                .toList(),
            onChanged: _loading
                ? null
                : (v) {
                    if (v != null) {
                      setState(() => _emaPeriod = v);
                      _renderChart();
                    }
                  },
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: _loading ? null : _load,
            icon: const Icon(Icons.refresh, color: Colors.white),
            tooltip: 'Refresh',
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_loading && _chartImage == null) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              Text(
                _error!,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
    if (_chartImage == null) {
      return const Center(
        child: Text(
          'No chart data',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }
    return Center(
      child: RawImage(
        image: _chartImage,
        fit: BoxFit.contain,
      ),
    );
  }
}
