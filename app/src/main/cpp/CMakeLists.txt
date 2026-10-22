cmake_minimum_required(VERSION 3.22)
project(pacman_android C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Placeholder until the ReXGlue SDK platform layer is ported (see README.md).
add_library(pacman SHARED pacman_android.cpp)
target_link_libraries(pacman android log)
