# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.8

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/LabWork.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/LabWork.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/LabWork.dir/flags.make

CMakeFiles/LabWork.dir/main.c.o: CMakeFiles/LabWork.dir/flags.make
CMakeFiles/LabWork.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/LabWork.dir/main.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/LabWork.dir/main.c.o   -c /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/main.c

CMakeFiles/LabWork.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/LabWork.dir/main.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/main.c > CMakeFiles/LabWork.dir/main.c.i

CMakeFiles/LabWork.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/LabWork.dir/main.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/main.c -o CMakeFiles/LabWork.dir/main.c.s

CMakeFiles/LabWork.dir/main.c.o.requires:

.PHONY : CMakeFiles/LabWork.dir/main.c.o.requires

CMakeFiles/LabWork.dir/main.c.o.provides: CMakeFiles/LabWork.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/LabWork.dir/build.make CMakeFiles/LabWork.dir/main.c.o.provides.build
.PHONY : CMakeFiles/LabWork.dir/main.c.o.provides

CMakeFiles/LabWork.dir/main.c.o.provides.build: CMakeFiles/LabWork.dir/main.c.o


CMakeFiles/LabWork.dir/clientudp.c.o: CMakeFiles/LabWork.dir/flags.make
CMakeFiles/LabWork.dir/clientudp.c.o: ../clientudp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/LabWork.dir/clientudp.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/LabWork.dir/clientudp.c.o   -c /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/clientudp.c

CMakeFiles/LabWork.dir/clientudp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/LabWork.dir/clientudp.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/clientudp.c > CMakeFiles/LabWork.dir/clientudp.c.i

CMakeFiles/LabWork.dir/clientudp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/LabWork.dir/clientudp.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/clientudp.c -o CMakeFiles/LabWork.dir/clientudp.c.s

CMakeFiles/LabWork.dir/clientudp.c.o.requires:

.PHONY : CMakeFiles/LabWork.dir/clientudp.c.o.requires

CMakeFiles/LabWork.dir/clientudp.c.o.provides: CMakeFiles/LabWork.dir/clientudp.c.o.requires
	$(MAKE) -f CMakeFiles/LabWork.dir/build.make CMakeFiles/LabWork.dir/clientudp.c.o.provides.build
.PHONY : CMakeFiles/LabWork.dir/clientudp.c.o.provides

CMakeFiles/LabWork.dir/clientudp.c.o.provides.build: CMakeFiles/LabWork.dir/clientudp.c.o


CMakeFiles/LabWork.dir/serverudp.c.o: CMakeFiles/LabWork.dir/flags.make
CMakeFiles/LabWork.dir/serverudp.c.o: ../serverudp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/LabWork.dir/serverudp.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/LabWork.dir/serverudp.c.o   -c /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/serverudp.c

CMakeFiles/LabWork.dir/serverudp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/LabWork.dir/serverudp.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/serverudp.c > CMakeFiles/LabWork.dir/serverudp.c.i

CMakeFiles/LabWork.dir/serverudp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/LabWork.dir/serverudp.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/serverudp.c -o CMakeFiles/LabWork.dir/serverudp.c.s

CMakeFiles/LabWork.dir/serverudp.c.o.requires:

.PHONY : CMakeFiles/LabWork.dir/serverudp.c.o.requires

CMakeFiles/LabWork.dir/serverudp.c.o.provides: CMakeFiles/LabWork.dir/serverudp.c.o.requires
	$(MAKE) -f CMakeFiles/LabWork.dir/build.make CMakeFiles/LabWork.dir/serverudp.c.o.provides.build
.PHONY : CMakeFiles/LabWork.dir/serverudp.c.o.provides

CMakeFiles/LabWork.dir/serverudp.c.o.provides.build: CMakeFiles/LabWork.dir/serverudp.c.o


CMakeFiles/LabWork.dir/clientudp2.c.o: CMakeFiles/LabWork.dir/flags.make
CMakeFiles/LabWork.dir/clientudp2.c.o: ../clientudp2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/LabWork.dir/clientudp2.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/LabWork.dir/clientudp2.c.o   -c /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/clientudp2.c

CMakeFiles/LabWork.dir/clientudp2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/LabWork.dir/clientudp2.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/clientudp2.c > CMakeFiles/LabWork.dir/clientudp2.c.i

CMakeFiles/LabWork.dir/clientudp2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/LabWork.dir/clientudp2.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/clientudp2.c -o CMakeFiles/LabWork.dir/clientudp2.c.s

CMakeFiles/LabWork.dir/clientudp2.c.o.requires:

.PHONY : CMakeFiles/LabWork.dir/clientudp2.c.o.requires

CMakeFiles/LabWork.dir/clientudp2.c.o.provides: CMakeFiles/LabWork.dir/clientudp2.c.o.requires
	$(MAKE) -f CMakeFiles/LabWork.dir/build.make CMakeFiles/LabWork.dir/clientudp2.c.o.provides.build
.PHONY : CMakeFiles/LabWork.dir/clientudp2.c.o.provides

CMakeFiles/LabWork.dir/clientudp2.c.o.provides.build: CMakeFiles/LabWork.dir/clientudp2.c.o


CMakeFiles/LabWork.dir/serverudp2.c.o: CMakeFiles/LabWork.dir/flags.make
CMakeFiles/LabWork.dir/serverudp2.c.o: ../serverudp2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/LabWork.dir/serverudp2.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/LabWork.dir/serverudp2.c.o   -c /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/serverudp2.c

CMakeFiles/LabWork.dir/serverudp2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/LabWork.dir/serverudp2.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/serverudp2.c > CMakeFiles/LabWork.dir/serverudp2.c.i

CMakeFiles/LabWork.dir/serverudp2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/LabWork.dir/serverudp2.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/serverudp2.c -o CMakeFiles/LabWork.dir/serverudp2.c.s

CMakeFiles/LabWork.dir/serverudp2.c.o.requires:

.PHONY : CMakeFiles/LabWork.dir/serverudp2.c.o.requires

CMakeFiles/LabWork.dir/serverudp2.c.o.provides: CMakeFiles/LabWork.dir/serverudp2.c.o.requires
	$(MAKE) -f CMakeFiles/LabWork.dir/build.make CMakeFiles/LabWork.dir/serverudp2.c.o.provides.build
.PHONY : CMakeFiles/LabWork.dir/serverudp2.c.o.provides

CMakeFiles/LabWork.dir/serverudp2.c.o.provides.build: CMakeFiles/LabWork.dir/serverudp2.c.o


# Object files for target LabWork
LabWork_OBJECTS = \
"CMakeFiles/LabWork.dir/main.c.o" \
"CMakeFiles/LabWork.dir/clientudp.c.o" \
"CMakeFiles/LabWork.dir/serverudp.c.o" \
"CMakeFiles/LabWork.dir/clientudp2.c.o" \
"CMakeFiles/LabWork.dir/serverudp2.c.o"

# External object files for target LabWork
LabWork_EXTERNAL_OBJECTS =

LabWork: CMakeFiles/LabWork.dir/main.c.o
LabWork: CMakeFiles/LabWork.dir/clientudp.c.o
LabWork: CMakeFiles/LabWork.dir/serverudp.c.o
LabWork: CMakeFiles/LabWork.dir/clientudp2.c.o
LabWork: CMakeFiles/LabWork.dir/serverudp2.c.o
LabWork: CMakeFiles/LabWork.dir/build.make
LabWork: CMakeFiles/LabWork.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking C executable LabWork"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LabWork.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/LabWork.dir/build: LabWork

.PHONY : CMakeFiles/LabWork.dir/build

CMakeFiles/LabWork.dir/requires: CMakeFiles/LabWork.dir/main.c.o.requires
CMakeFiles/LabWork.dir/requires: CMakeFiles/LabWork.dir/clientudp.c.o.requires
CMakeFiles/LabWork.dir/requires: CMakeFiles/LabWork.dir/serverudp.c.o.requires
CMakeFiles/LabWork.dir/requires: CMakeFiles/LabWork.dir/clientudp2.c.o.requires
CMakeFiles/LabWork.dir/requires: CMakeFiles/LabWork.dir/serverudp2.c.o.requires

.PHONY : CMakeFiles/LabWork.dir/requires

CMakeFiles/LabWork.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/LabWork.dir/cmake_clean.cmake
.PHONY : CMakeFiles/LabWork.dir/clean

CMakeFiles/LabWork.dir/depend:
	cd /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/cmake-build-debug /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/cmake-build-debug /Users/so/Desktop/Y2S2/Retele/Lab3/LabWork/cmake-build-debug/CMakeFiles/LabWork.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/LabWork.dir/depend

