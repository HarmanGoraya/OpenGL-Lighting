add_executable(run_p3
  main.cpp
  geometry_triangle.cpp)
target_link_libraries(run_p3 PUBLIC util-core-3.3 glm)
set_target_properties(run_p3 PROPERTIES CXX_STANDARD 11) 
target_add_embeded_shaders(run_p3
  OUTPUT_NAME shaders.h SHADERS 
  vshader=shading_vertex.glsl 
  fshader=shading_fragment.glsl)

foreach(f shader_pass.glsl
        shader_color.glsl)
    file(COPY ${f} DESTINATION ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
endforeach()
