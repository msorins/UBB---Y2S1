cmake_minimum_required(VERSION 3.8)
project(HW)

set(CMAKE_C_STANDARD 99)

set(SOURCE_FILES client.c server.c client_v2.c server_v2.c)
add_executable(HW ${SOURCE_FILES})