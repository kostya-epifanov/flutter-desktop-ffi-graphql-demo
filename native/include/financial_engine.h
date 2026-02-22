#ifndef FINANCIAL_ENGINE_H
#define FINANCIAL_ENGINE_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
  int64_t timestamp;
  double open;
  double high;
  double low;
  double close;
  double volume;
} Candle;

/**
 * Calculates EMA for the given price series.
 * Caller must free the returned buffer using free_buffer().
 */
double* calculate_ema(const double* prices, int32_t length, int32_t period);

/**
 * Renders candlesticks into an RGBA buffer (width * height * 4 bytes).
 * Caller must free the returned buffer using free_buffer().
 */
uint8_t* render_candles(const Candle* candles, int32_t count, int32_t width,
                        int32_t height);

/**
 * Frees any buffer allocated by calculate_ema or render_candles.
 */
void free_buffer(void* ptr);

#ifdef __cplusplus
}
#endif

#endif /* FINANCIAL_ENGINE_H */
