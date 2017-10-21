cmake_minimum_required(VERSION 3.8)
project(LabWork)

set(CMAKE_C_STANDARD 99)

set(SOURCE_FILES main.c clientudp.c serverudp.c clientudp2.c serverudp2.c)
add_executable(LabWork ${SOURCE_FILES})