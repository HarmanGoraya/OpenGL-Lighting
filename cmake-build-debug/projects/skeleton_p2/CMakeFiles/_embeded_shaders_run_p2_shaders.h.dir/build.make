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

# Utility rule file for _embeded_shaders_run_p2_shaders.h.

# Include the progress variables for this target.
include projects/skeleton_p2/CMakeFiles/_embeded_shaders_run_p2_shaders.h.dir/progress.make

projects/skeleton_p2/CMakeFiles/_embeded_shaders_run_p2_shaders.h:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "generate embeded shaders for run_p2"
	cd "/Users/amritgoraya/Downloads/ecs175-demo 2/projects/skeleton_p2" && "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/bin2c" -o shaders.h -n vshader shader_p2_vertex.glsl -n fshader shader_p2_fragment.glsl

_embeded_shaders_run_p2_shaders.h: projects/skeleton_p2/CMakeFiles/_embeded_shaders_run_p2_shaders.h
_embeded_shaders_run_p2_shaders.h: projects/skeleton_p2/CMakeFiles/_embeded_shaders_run_p2_shaders.h.dir/build.make

.PHONY : _embeded_shaders_run_p2_shaders.h

# Rule to build all files generated by this target.
projects/skeleton_p2/CMakeFiles/_embeded_shaders_run_p2_shaders.h.dir/build: _embeded_shaders_run_p2_shaders.h

.PHONY : projects/skeleton_p2/CMakeFiles/_embeded_shaders_run_p2_shaders.h.dir/build

projects/skeleton_p2/CMakeFiles/_embeded_shaders_run_p2_shaders.h.dir/clean:
	cd "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/projects/skeleton_p2" && $(CMAKE_COMMAND) -P CMakeFiles/_embeded_shaders_run_p2_shaders.h.dir/cmake_clean.cmake
.PHONY : projects/skeleton_p2/CMakeFiles/_embeded_shaders_run_p2_shaders.h.dir/clean

projects/skeleton_p2/CMakeFiles/_embeded_shaders_run_p2_shaders.h.dir/depend:
	cd "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/amritgoraya/Downloads/ecs175-demo 2" "/Users/amritgoraya/Downloads/ecs175-demo 2/projects/skeleton_p2" "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug" "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/projects/skeleton_p2" "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/projects/skeleton_p2/CMakeFiles/_embeded_shaders_run_p2_shaders.h.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : projects/skeleton_p2/CMakeFiles/_embeded_shaders_run_p2_shaders.h.dir/depend

