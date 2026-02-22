cmake_minimum_required(VERSION 3.15)
project(financial_engine)

set(CMAKE_CXX_STANDARD 17)

add_library(financial_engine SHARED
  src/ema.cpp
  src/renderer.cpp
  src/financial_engine.cpp
)

target_include_directories(financial_engine
  PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)
