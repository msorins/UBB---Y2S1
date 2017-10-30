cmake_minimum_required(VERSION 3.8)
project(LabWork3)

set(CMAKE_C_STANDARD 99)

set(SOURCE_FILES main.c server.c)
add_executable(LabWork3 ${SOURCE_FILES})