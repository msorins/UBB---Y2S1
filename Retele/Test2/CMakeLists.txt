cmake_minimum_required(VERSION 3.8)
project(Test2)

set(CMAKE_C_STANDARD 99)

set(SOURCE_FILES main.c Client.c ClientC.cpp Server.c)
add_executable(Test2 ${SOURCE_FILES})