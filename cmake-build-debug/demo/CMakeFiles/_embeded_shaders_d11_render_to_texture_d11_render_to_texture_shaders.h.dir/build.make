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

# Utility rule file for _embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h.

# Include the progress variables for this target.
include demo/CMakeFiles/_embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h.dir/progress.make

demo/CMakeFiles/_embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "generate embeded shaders for d11_render_to_texture"
	cd "/Users/amritgoraya/Downloads/ecs175-demo 2/demo" && "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/bin2c" -o d11_render_to_texture/shaders.h -n vshader_rtt d11_render_to_texture/shader_d11_rtt_vertex.glsl -n fshader_rtt d11_render_to_texture/shader_d11_rtt_fragment.glsl -n vshader_quad d11_render_to_texture/shader_passthrough.glsl -n fshader_quad d11_render_to_texture/shader_wobbly_texture.glsl

_embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h: demo/CMakeFiles/_embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h
_embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h: demo/CMakeFiles/_embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h.dir/build.make

.PHONY : _embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h

# Rule to build all files generated by this target.
demo/CMakeFiles/_embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h.dir/build: _embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h

.PHONY : demo/CMakeFiles/_embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h.dir/build

demo/CMakeFiles/_embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h.dir/clean:
	cd "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/demo" && $(CMAKE_COMMAND) -P CMakeFiles/_embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h.dir/cmake_clean.cmake
.PHONY : demo/CMakeFiles/_embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h.dir/clean

demo/CMakeFiles/_embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h.dir/depend:
	cd "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/amritgoraya/Downloads/ecs175-demo 2" "/Users/amritgoraya/Downloads/ecs175-demo 2/demo" "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug" "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/demo" "/Users/amritgoraya/Downloads/ecs175-demo 2/cmake-build-debug/demo/CMakeFiles/_embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : demo/CMakeFiles/_embeded_shaders_d11_render_to_texture_d11_render_to_texture_shaders.h.dir/depend

