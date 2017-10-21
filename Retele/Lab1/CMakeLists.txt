cmake_minimum_required(VERSION 3.8)
project(Lab1)

set(CMAKE_C_STANDARD 99)

set(SOURCE_FILES server.c client.c pb_3/client.c pb_3/server.c)
add_executable(Lab1 ${SOURCE_FILES})