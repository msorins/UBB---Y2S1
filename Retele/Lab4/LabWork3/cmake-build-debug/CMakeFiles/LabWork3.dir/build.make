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
CMAKE_SOURCE_DIR = /Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/LabWork3.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/LabWork3.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/LabWork3.dir/flags.make

CMakeFiles/LabWork3.dir/main.c.o: CMakeFiles/LabWork3.dir/flags.make
CMakeFiles/LabWork3.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/LabWork3.dir/main.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/LabWork3.dir/main.c.o   -c /Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3/main.c

CMakeFiles/LabWork3.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/LabWork3.dir/main.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3/main.c > CMakeFiles/LabWork3.dir/main.c.i

CMakeFiles/LabWork3.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/LabWork3.dir/main.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3/main.c -o CMakeFiles/LabWork3.dir/main.c.s

CMakeFiles/LabWork3.dir/main.c.o.requires:

.PHONY : CMakeFiles/LabWork3.dir/main.c.o.requires

CMakeFiles/LabWork3.dir/main.c.o.provides: CMakeFiles/LabWork3.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/LabWork3.dir/build.make CMakeFiles/LabWork3.dir/main.c.o.provides.build
.PHONY : CMakeFiles/LabWork3.dir/main.c.o.provides

CMakeFiles/LabWork3.dir/main.c.o.provides.build: CMakeFiles/LabWork3.dir/main.c.o


CMakeFiles/LabWork3.dir/server.c.o: CMakeFiles/LabWork3.dir/flags.make
CMakeFiles/LabWork3.dir/server.c.o: ../server.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/LabWork3.dir/server.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/LabWork3.dir/server.c.o   -c /Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3/server.c

CMakeFiles/LabWork3.dir/server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/LabWork3.dir/server.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3/server.c > CMakeFiles/LabWork3.dir/server.c.i

CMakeFiles/LabWork3.dir/server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/LabWork3.dir/server.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3/server.c -o CMakeFiles/LabWork3.dir/server.c.s

CMakeFiles/LabWork3.dir/server.c.o.requires:

.PHONY : CMakeFiles/LabWork3.dir/server.c.o.requires

CMakeFiles/LabWork3.dir/server.c.o.provides: CMakeFiles/LabWork3.dir/server.c.o.requires
	$(MAKE) -f CMakeFiles/LabWork3.dir/build.make CMakeFiles/LabWork3.dir/server.c.o.provides.build
.PHONY : CMakeFiles/LabWork3.dir/server.c.o.provides

CMakeFiles/LabWork3.dir/server.c.o.provides.build: CMakeFiles/LabWork3.dir/server.c.o


# Object files for target LabWork3
LabWork3_OBJECTS = \
"CMakeFiles/LabWork3.dir/main.c.o" \
"CMakeFiles/LabWork3.dir/server.c.o"

# External object files for target LabWork3
LabWork3_EXTERNAL_OBJECTS =

LabWork3: CMakeFiles/LabWork3.dir/main.c.o
LabWork3: CMakeFiles/LabWork3.dir/server.c.o
LabWork3: CMakeFiles/LabWork3.dir/build.make
LabWork3: CMakeFiles/LabWork3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable LabWork3"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LabWork3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/LabWork3.dir/build: LabWork3

.PHONY : CMakeFiles/LabWork3.dir/build

CMakeFiles/LabWork3.dir/requires: CMakeFiles/LabWork3.dir/main.c.o.requires
CMakeFiles/LabWork3.dir/requires: CMakeFiles/LabWork3.dir/server.c.o.requires

.PHONY : CMakeFiles/LabWork3.dir/requires

CMakeFiles/LabWork3.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/LabWork3.dir/cmake_clean.cmake
.PHONY : CMakeFiles/LabWork3.dir/clean

CMakeFiles/LabWork3.dir/depend:
	cd /Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3 /Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3 /Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3/cmake-build-debug /Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3/cmake-build-debug /Users/so/Desktop/Y2S2/Retele/Lab4/LabWork3/cmake-build-debug/CMakeFiles/LabWork3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/LabWork3.dir/depend

