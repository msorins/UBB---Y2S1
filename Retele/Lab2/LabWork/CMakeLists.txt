cmake_minimum_required(VERSION 3.8)
project(LabWork)

set(CMAKE_C_STANDARD 99)

set(SOURCE_FILES client.c serverProcess.c)
add_executable(LabWork ${SOURCE_FILES})