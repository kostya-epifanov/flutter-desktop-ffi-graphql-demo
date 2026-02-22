#include "../include/financial_engine.h"
#include <cstdlib>

extern "C" {

void free_buffer(void* ptr) {
  if (ptr != nullptr) {
    free(ptr);
  }
}

}  // extern "C"
