# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

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
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/Users/amritgoraya/Downloads/ecs175-demo 2"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug"

# Include any dependencies generated for this target.
include demo/CMakeFiles/d8_texture_cube.dir/depend.make

# Include the progress variables for this target.
include demo/CMakeFiles/d8_texture_cube.dir/progress.make

# Include the compile flags for this target's objects.
include demo/CMakeFiles/d8_texture_cube.dir/flags.make

demo/CMakeFiles/d8_texture_cube.dir/d8_texture_cube/main.cpp.o: demo/CMakeFiles/d8_texture_cube.dir/flags.make
demo/CMakeFiles/d8_texture_cube.dir/d8_texture_cube/main.cpp.o: ../demo/d8_texture_cube/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object demo/CMakeFiles/d8_texture_cube.dir/d8_texture_cube/main.cpp.o"
	cd "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/demo" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/d8_texture_cube.dir/d8_texture_cube/main.cpp.o -c "/Users/amritgoraya/Downloads/ecs175-demo 2/demo/d8_texture_cube/main.cpp"

demo/CMakeFiles/d8_texture_cube.dir/d8_texture_cube/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/d8_texture_cube.dir/d8_texture_cube/main.cpp.i"
	cd "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/demo" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/amritgoraya/Downloads/ecs175-demo 2/demo/d8_texture_cube/main.cpp" > CMakeFiles/d8_texture_cube.dir/d8_texture_cube/main.cpp.i

demo/CMakeFiles/d8_texture_cube.dir/d8_texture_cube/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/d8_texture_cube.dir/d8_texture_cube/main.cpp.s"
	cd "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/demo" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/amritgoraya/Downloads/ecs175-demo 2/demo/d8_texture_cube/main.cpp" -o CMakeFiles/d8_texture_cube.dir/d8_texture_cube/main.cpp.s

# Object files for target d8_texture_cube
d8_texture_cube_OBJECTS = \
"CMakeFiles/d8_texture_cube.dir/d8_texture_cube/main.cpp.o"

# External object files for target d8_texture_cube
d8_texture_cube_EXTERNAL_OBJECTS =

d8_texture_cube: demo/CMakeFiles/d8_texture_cube.dir/d8_texture_cube/main.cpp.o
d8_texture_cube: demo/CMakeFiles/d8_texture_cube.dir/build.make
d8_texture_cube: util/libutil-core-3.3.a
d8_texture_cube: imgui-1.79/libimgui-core-3.3.a
d8_texture_cube: glad-core-3.3/libglad-core-3.3.a
d8_texture_cube: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd
d8_texture_cube: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd
d8_texture_cube: glfw-3.3.2/src/libglfw3.a
d8_texture_cube: demo/CMakeFiles/d8_texture_cube.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../d8_texture_cube"
	cd "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/demo" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/d8_texture_cube.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
demo/CMakeFiles/d8_texture_cube.dir/build: d8_texture_cube

.PHONY : demo/CMakeFiles/d8_texture_cube.dir/build

demo/CMakeFiles/d8_texture_cube.dir/clean:
	cd "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/demo" && $(CMAKE_COMMAND) -P CMakeFiles/d8_texture_cube.dir/cmake_clean.cmake
.PHONY : demo/CMakeFiles/d8_texture_cube.dir/clean

demo/CMakeFiles/d8_texture_cube.dir/depend:
	cd "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/amritgoraya/Downloads/ecs175-demo 2" "/Users/amritgoraya/Downloads/ecs175-demo 2/demo" "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug" "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/demo" "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/demo/CMakeFiles/d8_texture_cube.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : demo/CMakeFiles/d8_texture_cube.dir/depend

