cmake_minimum_required(VERSION 3.8)
project(Lab1Test)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES main.cpp Node.cpp Node.h SLL.cpp SLL.h)
add_executable(Lab1Test ${SOURCE_FILES})