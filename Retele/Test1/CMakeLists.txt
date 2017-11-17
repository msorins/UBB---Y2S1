cmake_minimum_required(VERSION 3.8)
project(Test1)

set(CMAKE_C_STANDARD 99)

set(SOURCE_FILES main.c client.c server_v2.c client_v2.c)
add_executable(Test1 ${SOURCE_FILES})