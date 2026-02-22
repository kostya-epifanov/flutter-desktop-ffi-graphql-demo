#include "../include/financial_engine.h"
#include <algorithm>
#include <cmath>
#include <cstdlib>
#include <cstring>

namespace {

// Background color #1a1a2e (dark blue-gray)
constexpr uint8_t kBgR = 0x1a;
constexpr uint8_t kBgG = 0x1a;
constexpr uint8_t kBgb = 0x2e;
constexpr uint8_t kBga = 0xff;

// Bullish candle (close >= open): green
constexpr uint8_t kGreenR = 0x22;
constexpr uint8_t kGreenG = 0xc5;
constexpr uint8_t kGreenB = 0x5e;
constexpr uint8_t kGreenA = 0xff;

// Bearish candle (close < open): red
constexpr uint8_t kRedR = 0xef;
constexpr uint8_t kRedG = 0x44;
constexpr uint8_t kRedB = 0x44;
constexpr uint8_t kRedA = 0xff;

// Wick color (gray)
constexpr uint8_t kWickR = 0x94;
constexpr uint8_t kWickG = 0xa3;
constexpr uint8_t kWickB = 0xb8;
constexpr uint8_t kWickA = 0xff;

// EMA line color (bright cyan)
constexpr uint8_t kEmaR = 0x7d;
constexpr uint8_t kEmaG = 0xd4;
constexpr uint8_t kEmaB = 0xff;
constexpr uint8_t kEmaA = 0xff;

void set_pixel(uint8_t* buffer, int32_t width, int32_t x, int32_t y, uint8_t r,
               uint8_t g, uint8_t b, uint8_t a) {
  if (x < 0 || x >= width || y < 0) return;
  size_t idx = static_cast<size_t>(y * width + x) * 4;
  buffer[idx] = r;
  buffer[idx + 1] = g;
  buffer[idx + 2] = b;
  buffer[idx + 3] = a;
}

void draw_line_v(uint8_t* buffer, int32_t width, int32_t height, int32_t x,
                 int32_t y0, int32_t y1, uint8_t r, uint8_t g, uint8_t b,
                 uint8_t a) {
  if (x < 0 || x >= width) return;
  int32_t lo = std::min(y0, y1);
  int32_t hi = std::max(y0, y1);
  for (int32_t y = lo; y <= hi && y < height; ++y) {
    if (y >= 0) {
      set_pixel(buffer, width, x, y, r, g, b, a);
    }
  }
}

void draw_rect_v(uint8_t* buffer, int32_t width, int32_t height, int32_t x,
                 int32_t y_top, int32_t y_bot, uint8_t r, uint8_t g, uint8_t b,
                 uint8_t a) {
  if (x < 0 || x >= width) return;
  int32_t lo = std::max(0, std::min(y_top, y_bot));
  int32_t hi = std::min(height - 1, std::max(y_top, y_bot));
  for (int32_t y = lo; y <= hi; ++y) {
    set_pixel(buffer, width, x, y, r, g, b, a);
  }
}

// Bresenham's line algorithm for diagonal segments (EMA line).
// thickness 2: draws a 2px-wide line for better visibility.
void draw_line_thick(uint8_t* buffer, int32_t width, int32_t height,
                     int32_t x0, int32_t y0, int32_t x1, int32_t y1,
                     uint8_t r, uint8_t g, uint8_t b, uint8_t a,
                     int32_t thickness) {
  int32_t dx = std::abs(x1 - x0);
  int32_t dy = std::abs(y1 - y0);
  int32_t sx = (x0 < x1) ? 1 : -1;
  int32_t sy = (y0 < y1) ? 1 : -1;
  int32_t err = dx - dy;

  while (true) {
    for (int32_t oy = 0; oy < thickness; ++oy) {
      for (int32_t ox = 0; ox < thickness; ++ox) {
        int32_t px = x0 + ox;
        int32_t py = y0 + oy;
        if (px >= 0 && px < width && py >= 0 && py < height) {
          set_pixel(buffer, width, px, py, r, g, b, a);
        }
      }
    }
    if (x0 == x1 && y0 == y1) break;
    int32_t e2 = 2 * err;
    if (e2 > -dy) {
      err -= dy;
      x0 += sx;
    }
    if (e2 < dx) {
      err += dx;
      y0 += sy;
    }
  }
}

}  // namespace

extern "C" {

uint8_t* render_candles(const Candle* candles, int32_t count, int32_t width,
                        int32_t height, const double* ema, int32_t ema_count) {
  if (candles == nullptr || count <= 0 || width <= 0 || height <= 0) {
    return nullptr;
  }

  const bool draw_ema = (ema != nullptr && ema_count == count);

  size_t size = static_cast<size_t>(width) * static_cast<size_t>(height) * 4;
  uint8_t* buffer = static_cast<uint8_t*>(malloc(size));
  if (buffer == nullptr) {
    return nullptr;
  }

  // Fill background
  for (int32_t i = 0; i < width * height; ++i) {
    buffer[i * 4] = kBgR;
    buffer[i * 4 + 1] = kBgG;
    buffer[i * 4 + 2] = kBgb;
    buffer[i * 4 + 3] = kBga;
  }

  // Price range (include EMA values when drawing EMA)
  double price_min = candles[0].low;
  double price_max = candles[0].high;
  for (int32_t i = 1; i < count; ++i) {
    price_min = std::min(price_min, candles[i].low);
    price_max = std::max(price_max, candles[i].high);
  }
  if (draw_ema) {
    for (int32_t i = 0; i < count; ++i) {
      if (!std::isnan(ema[i])) {
        price_min = std::min(price_min, ema[i]);
        price_max = std::max(price_max, ema[i]);
      }
    }
  }
  double price_range = price_max - price_min;
  if (price_range < 1e-12) price_range = 1.0;

  // Chart area: leave padding
  const int32_t pad_x = width / 40;
  const int32_t pad_y = height / 20;
  const int32_t chart_w = width - 2 * pad_x;
  const int32_t chart_h = height - 2 * pad_y;

  // Map price to Y: top of chart = price_max
  auto price_to_y = [&](double p) -> int32_t {
    double t = (p - price_min) / price_range;
    return pad_y + static_cast<int32_t>((1.0 - t) * chart_h);
  };

  // Candle dimensions
  const int32_t candle_total_w = chart_w / count;
  const int32_t body_w = std::max(1, candle_total_w - 2);
  const int32_t gap = std::max(0, candle_total_w - body_w);

  for (int32_t i = 0; i < count; ++i) {
    const Candle& c = candles[i];
    int32_t cx = pad_x + i * candle_total_w + candle_total_w / 2;
    int32_t y_high = price_to_y(c.high);
    int32_t y_low = price_to_y(c.low);
    int32_t y_open = price_to_y(c.open);
    int32_t y_close = price_to_y(c.close);

    // Wick (1px wide, high to low)
    draw_line_v(buffer, width, height, cx, y_high, y_low, kWickR, kWickG, kWickB,
                kWickA);

    // Body
    int32_t body_top = std::min(y_open, y_close);
    int32_t body_bot = std::max(y_open, y_close);
    bool bullish = c.close >= c.open;
    uint8_t r = bullish ? kGreenR : kRedR;
    uint8_t g = bullish ? kGreenG : kRedG;
    uint8_t b = bullish ? kGreenB : kRedB;
    uint8_t a = bullish ? kGreenA : kRedA;

    for (int32_t dx = -body_w / 2; dx <= body_w / 2; ++dx) {
      draw_rect_v(buffer, width, height, cx + dx, body_top, body_bot, r, g, b,
                  a);
    }
  }

  // Draw EMA line overlay
  if (draw_ema) {
    int32_t prev_cx = -1;
    int32_t prev_y = -1;
    for (int32_t i = 0; i < count; ++i) {
      double v = ema[i];
      if (std::isnan(v)) continue;
      int32_t cx = pad_x + i * candle_total_w + candle_total_w / 2;
      int32_t y = price_to_y(v);
      if (prev_cx >= 0) {
        draw_line_thick(buffer, width, height, prev_cx, prev_y, cx, y, kEmaR,
                        kEmaG, kEmaB, kEmaA, 2);
      }
      prev_cx = cx;
      prev_y = y;
    }
  }

  return buffer;
}

}  // extern "C"
