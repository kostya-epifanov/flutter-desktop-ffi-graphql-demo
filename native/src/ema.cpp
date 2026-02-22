#include "../include/financial_engine.h"
#include <cstdlib>
#include <cstring>

extern "C" {

double* calculate_ema(const double* prices, int32_t length, int32_t period) {
  if (prices == nullptr || length <= 0 || period <= 0 || period > length) {
    return nullptr;
  }

  double* result = static_cast<double*>(malloc(static_cast<size_t>(length) *
                                              sizeof(double)));
  if (result == nullptr) {
    return nullptr;
  }

  const double multiplier = 2.0 / (static_cast<double>(period) + 1.0);

  // Seed with SMA of first `period` values for result[period - 1]
  double sum = 0.0;
  for (int32_t i = 0; i < period; ++i) {
    sum += prices[i];
  }
  double ema = sum / static_cast<double>(period);
  result[period - 1] = ema;

  // Fill initial values before period with NaN or first price
  for (int32_t i = 0; i < period - 1; ++i) {
    result[i] = prices[i];
  }

  // Calculate EMA for rest: EMA = (price - prev_ema) * multiplier + prev_ema
  for (int32_t i = period; i < length; ++i) {
    ema = (prices[i] - ema) * multiplier + ema;
    result[i] = ema;
  }

  return result;
}

}  // extern "C"
