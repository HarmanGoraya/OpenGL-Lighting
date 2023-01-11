

// Include standard headers
#include <stdio.h>
#include <stdlib.h>
#include <vector>
#include <algorithm>

#include "shaders.h"
#include "util.hpp"
#include <chrono>

GLFWwindow* window;
#include <imgui.h>
#include <imgui_impl_glfw.h>
#include <imgui_impl_opengl3.h>

// Include GLM
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/transform.hpp>
using namespace glm;

#include "arcball_camera.h"
ArcballCamera camera(vec3(0, 0, 4), vec3(0, 0, 0), vec3(0, 1, 0));

#include "geometry_triangle.h"
TriangleArrayObjects* objects;

std::vector<TriangleArrayObjects*>Obj;

bool enable_painter_algorithm = false;

void
cursor(GLFWwindow* window, double xpos, double ypos)
{
}



struct FrameBufferObject {
  GLuint framebuffer_id = 0;
  // Texture which will contain the RGB output of our shader.
  GLuint color_tex;
  // An optional depth buffer. This enables depth-testing.
  GLuint depth_tex; // depth texture. slower, but you can sample it later in your shader
  GLuint depth_rb; // depth render buffer: faster

  void
  Generate()
  {
    glGenFramebuffers(1, &framebuffer_id);
    glGenTextures(1, &color_tex);
    glGenTextures(1, &depth_tex);
    glGenRenderbuffers(1, &depth_rb);
  }

  void
  Resize(int width, int height, bool enable_depth_texture)
  {
    BindFramebuffer();

    // "Bind" the newly created texture : all future texture functions will modify this texture
    glBindTexture(GL_TEXTURE_2D, color_tex);
    {
      // Give an empty image to OpenGL ( the last "0" means "empty" )
      glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0, GL_RGB, GL_UNSIGNED_BYTE, 0);

      // Poor filtering
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    }
    // Set "renderedTexture" as our colour attachement #0
    glFramebufferTexture(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, color_tex, 0);

    // The depth buffer
    if (!enable_depth_texture) {
      glBindRenderbuffer(GL_RENDERBUFFER, depth_rb);
      glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT, width, height);
      glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, depth_rb);
    }
    else {
      glBindTexture(GL_TEXTURE_2D, depth_tex);
      glTexImage2D(GL_TEXTURE_2D, 0, GL_DEPTH_COMPONENT24, width, height, 0, GL_DEPTH_COMPONENT, GL_FLOAT, 0);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

      glFramebufferTexture(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, depth_tex, 0);
    }

    // Set the list of draw buffers.
    GLenum DrawBuffers[1] = { GL_COLOR_ATTACHMENT0 };
    glDrawBuffers(1, DrawBuffers); // "1" is the size of DrawBuffers

    // Always check that our framebuffer is ok
    if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE)
      throw std::runtime_error("framebuffer object incomplete");

    // Switch back to the default framebuffer
    UnbindFramebuffer();
  }

  void
  BindFramebuffer()
  {
    // Switch to the framebuffer object
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer_id);
  }

  void
  UnbindFramebuffer()
  {
    // Switch back to the default framebuffer
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
  }

  void
  BindColorTexture()
  {
    glBindTexture(GL_TEXTURE_2D, color_tex);
  }

  void
  BindDepthTexture()
  {
    glBindTexture(GL_TEXTURE_2D, depth_tex);
  }

  void
  Clear()
  {
    glDeleteFramebuffers(1, &framebuffer_id);
    glDeleteTextures(1, &color_tex);
    glDeleteTextures(1, &depth_tex);
    glDeleteRenderbuffers(1, &depth_rb);
  }
};

  FrameBufferObject fbo;
  bool render_depth = false;


static bool
CapturedByGUI()
{
  ImGuiIO& io = ImGui::GetIO();
  return (io.WantCaptureMouse);
}

static void
KeyCallback(GLFWwindow* window, int key, int scancode, int action, int mods)
{
  if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS) {
    glfwSetWindowShouldClose(window, GLFW_TRUE); // close window
  }
}

static void
CursorPositionCallback(GLFWwindow* window, double xpos, double ypos)
{
  if (!CapturedByGUI()) {
    int left_state = glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_LEFT);
    int right_state = glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_RIGHT);

    int width, height;
    glfwGetWindowSize(window, &width, &height);

    /* cursor projection */
    

    // right click
    if (right_state == GLFW_PRESS || right_state == GLFW_REPEAT) {
      
    }

    // left click
    if (left_state == GLFW_PRESS || left_state == GLFW_REPEAT) {
      
    }

    
  }
}

void
init()
{
  
  // Initialise GLFW
  if (!glfwInit()) {
    throw std::runtime_error("Failed to initialize GLFW");
  }

  const char* glsl_version = "#version 150"; // GL 3.3 + GLSL 150
  glfwWindowHint(GLFW_SAMPLES, 4);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
  glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
  glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
  glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);

  // Open a window and create its OpenGL context
  window = glfwCreateWindow(800, 800, "ECS 175 (press 'g' to display GUI)", NULL, NULL);
  if (window == NULL) {
    glfwTerminate();
    throw std::runtime_error("Failed to open GLFW window. If you have a GPU that is "
                             "not 3.3 compatible, try a lower OpenGL version.");
  }

  glfwMakeContextCurrent(window);
  glfwSetKeyCallback(window, KeyCallback);
  //glfwSetWindowSizeCallback(window, WindowSizeCallback);
  //glfwSetCursorPosCallback(window, CursorPositionCallback);
  glfwSwapInterval(1);

  // Load GLAD symbols
  int err = gladLoadGLLoader((GLADloadproc)glfwGetProcAddress) == 0;
  if (err) {
    throw std::runtime_error("Failed to initialize OpenGL loader!");
  }

  {
    // Setup Dear ImGui context
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();

    // Setup Dear ImGui style
    ImGui::StyleColorsDark();
    // or ImGui::StyleColorsClassic();

    // Initialize Dear ImGui
    ImGui_ImplGlfw_InitForOpenGL(
      window, true /* 'true' -> allow imgui to capture keyboard inputs */);
    ImGui_ImplOpenGL3_Init(glsl_version);
  }


  glfwSetCursorPosCallback(window, cursor);

  // Ensure we can capture the escape key being pressed below
  glfwSetInputMode(window, GLFW_STICKY_KEYS, GL_TRUE);

  // Dark blue background (avoid using black)
  glClearColor(0.0f, 0.0f, 0.4f, 0.0f);

  // Enable depth test
  glEnable(GL_DEPTH_TEST);
  // Accept fragment if it closer to the camera than the former one
  glDepthFunc(GL_LESS);
}


void
PainterAlgorithm(const TriangleArrayObjects::Mesh& mesh)
{
  
  auto* val = mesh.vertices.get();

  for(int i = 0;i<mesh.size_triangles - 1;i++){

    for(int j = 0;j<mesh.size_triangles - i - 1;j++){
      auto first_z = val[9*j+2];
      auto second_z = val[9*j+5];
      auto third_z = val[9*j+8];

      auto first_min = first_z < second_z ? first_z : second_z;
      first_min = first_min < third_z ? first_min : third_z;

      first_min = camera.eye().z - first_min;

      auto first_z2 = val[9*(j+1)+2];
      auto second_z2 = val[9*(j+1)+5];
      auto third_z2 = val[9*(j+1)+8];

      auto second_min = first_z2 < second_z2 ? first_z2 : second_z2;
      second_min = second_min < third_z2 ? second_min : third_z2;

      second_min = camera.eye().z - second_min;

      if(first_min > second_min){
        for(int k = 0;k<8;k++){
          auto temp = val[9*j+k];
          val[9*j+k] = val[9*(j+1)+k];
          val[9*(j+1)+k] = temp;
        }

      }

    }

  }

}


void imgui_setup(){
  ImGui::Begin("Options");
  static float col1[3]= {.5f,.0f,.0f};
  ImGui::ColorEdit3("Ambient",col1);
  static float col2[3] = {0.5f,.0f,.0f};
  ImGui::ColorEdit3("Diffuse",col2);
  static float col3[3] = {0.5f,.0f,.0f};
  ImGui::ColorEdit3("Specular",col2);
  static float lightpos[3] = {.0f,.0f,.5f};
  ImGui::SliderFloat3("Light Position",lightpos,0.0,5.0);
  static float Light_Intense = 1.0;
  ImGui::SliderFloat("Light Intensity",&Light_Intense,0.0,10.0);

  vec3 color;
  color.x = col1[0];
  color.y = col1[1];
  color.z = col1[2];



  ImGui::End();
}

int
main(const int argc, const char** argv)
{
  init();

  GLuint vao;
  glGenVertexArrays(1, &vao);
  glBindVertexArray(vao);

  // Create and compile our GLSL program from the shaders
  GLuint program_id = LoadProgram_FromEmbededTexts((char*)vshader, vshader_size, (char*)fshader, fshader_size);
  GLuint program_quad = LoadProgram_FromFiles("shader_pass.glsl","shader_color.glsl" );

  static const GLfloat g_quad_vertex_buffer_data[] = {
    -1.0f, -1.0f, 0.0f, 1.0f, -1.0f, 0.0f, -1.0f, 1.0f, 0.0f, -1.0f, 1.0f, 0.0f, 1.0f, -1.0f, 0.0f, 1.0f, 1.0f, 0.0f,
  };


  // Get a handle for our "MVP" uniform
  GLuint MVP_id = glGetUniformLocation(program_id, "MVP");
  GLuint MV_id = glGetUniformLocation(program_id, "MV");
  GLuint ey = glGetUniformLocation(program_id, "eye_pos");
  GLuint K_D = glGetUniformLocation(program_id,"Kd");
  GLuint K_A = glGetUniformLocation(program_id,"Ka");
  GLuint K_S = glGetUniformLocation(program_id,"Ks");
  GLuint Phong = glGetUniformLocation(program_id,"n");
  GLuint light_pos = glGetUniformLocation(program_id,"light_pos");
  GLuint light_Intensity = glGetUniformLocation(program_id,"IL");
  GLuint Amb_Intensity = glGetUniformLocation(program_id,"IA");
  GLuint Cons_K = glGetUniformLocation(program_id,"K");




  GLuint renderedTexture_id = glGetUniformLocation(program_quad, "renderedTexture");
  GLuint TextureID  = glGetUniformLocation(program_id, "myTextureSampler");
  GLuint hf = glGetUniformLocation(program_quad, "halftone");
  GLuint s = glGetUniformLocation(program_quad, "size");

  static int half = 1;





  // Load the texture
  GLuint tex = loadTexture_from_file("uvmap.jpg");

  // Read our .obj file
  //objects = ReadAsArrayObjects("suzanne.obj");

  //objects->Create();
  objects = ReadAsArrayObjects(std::string(argv[1]));
  objects->Create();

  //Obj.push_back(ReadAsArrayObjects("cube.obj"));
  //Obj[1]->Create();


  ivec2 framebuffer_size, window_size;
  glfwGetWindowSize(window,&window_size.x,&window_size.y);
  glfwGetFramebufferSize(window, &framebuffer_size.x, &framebuffer_size.y);



  fbo.Generate();
  //fbo.color_tex = TextureID;
  fbo.Resize(framebuffer_size.x, framebuffer_size.y, false);

  int Size = framebuffer_size.x;

  GLuint quad_vertexbuffer;
  glGenBuffers(1, &quad_vertexbuffer);
  glBindBuffer(GL_ARRAY_BUFFER, quad_vertexbuffer);
  glBufferData(GL_ARRAY_BUFFER, sizeof(g_quad_vertex_buffer_data), g_quad_vertex_buffer_data, GL_STATIC_DRAW);




  do {

    // Clear the screen

    // Use our shader

    for(int i = 0;i<3;i++) {

      static float col1[3] = { .5f, .0f, .0f };
      static float col2[3] = { 0.5f, .0f, .0f };
      static float col3[3] = { 0.5f, .0f, .0f };
      static float Light_Intense = 0.0;
      static float Ambient_Intense = 0.0;
      static float K = 1.0;
      static float n = 1.0;
      static float lightpos[3] = { .0f, .0f, .5f };
      static float eyepos[3] = { .0f, .0f, 4.0f };

      fbo.BindFramebuffer();
      glViewport(0, 0, framebuffer_size.x, framebuffer_size.y);
      glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
      glEnable(GL_DEPTH_TEST);

      glUseProgram(program_id);

      glActiveTexture(GL_TEXTURE0); // Bind our texture in Texture Unit 0
      glUniform1i(TextureID, 0); // Set our "renderedTexture" sampler to use Texture Unit 0
      fbo.BindColorTexture();



        // Send our transformation to the currently bound shader, in the "MVP" uniform

        mat4 P1 = ortho(-4.f, 4.f, -3.f, 3.f, 0.1f, 100.f);
        mat4 P = perspective(radians(45.0f), 4.0f / 3.0f, 0.1f, 100.0f);
        mat4 M = objects->GetModelMatrix();
        
        mat4 V;
        mat4 MVP;
        mat4 MV;
        if (i == 0) {
          ArcballCamera cam(vec3(0, 0, 4), vec3(0, 0, 0), vec3(0, 1, 0));
          V = cam.transform();
          MVP = P1 * V * M;
          MV = V * M;
        }
        if (i == 1) {
          ArcballCamera cam(vec3(4, 0, .001), vec3(0, 0, 0), vec3(0, 1, 0));
          V = cam.transform();
          MVP = P1 * V * M;
          MV = V * M;
        }
        if (i == 2) {
          ArcballCamera cam(vec3(0, 4, .001), vec3(0, 0, 0), vec3(0, 1, 0));
          V = cam.transform();
          MVP = P1 * V * M;
          MV = V * M;
        }



        // Send our transformation to the currently bound shader,
        // in the "MVP" uniform
        glUniformMatrix4fv(MVP_id, 1, GL_FALSE, &MVP[0][0]);
        glUniformMatrix4fv(MV_id, 1, GL_FALSE, &MV[0][0]);
        vec3 eye = camera.eye();
        glUniform3fv(ey, 1, &eyepos[0]);
        glUniform3fv(K_A, 1, &col1[0]);
        glUniform3fv(K_D, 1, &col2[0]);
        glUniform3fv(K_S, 1, &col3[0]);
        glUniform3fv(light_pos, 1, &lightpos[0]);
        glUniform1f(light_Intensity, Light_Intense);
        glUniform1f(Cons_K, K);
        glUniform1f(Phong, n);
        glUniform1f(Amb_Intensity, Ambient_Intense);



        if (!enable_painter_algorithm) {
          glEnable(GL_DEPTH_TEST);

          objects->Render();
          //Obj[j]->Render();

        }
        else {
          
          glDisable(GL_DEPTH_TEST);
          // -----------------------------------------------------------
          // painter's algorithm
          // -----------------------------------------------------------
          for (auto& m : objects->meshes)
            PainterAlgorithm(m);

          objects->Render();

        }


      fbo.UnbindFramebuffer();

      // -----------------------------------------------------------
      // post processing (half-toning)
      // -----------------------------------------------------------

      {

        if(i == 0){
          glClear(GL_COLOR_BUFFER_BIT);
          glViewport(0, 0, 400 , 400 );
        }
        if(i == 1){
          glViewport(400, 0, 400 , 400 );

        }
        if(i == 2){
          glViewport(0, 400, 400 , 400 );

        }

        //glViewport(0, 0, 800 * 2, 800 * 2);

        glDisable(GL_DEPTH_TEST);

        // Use our shader
        glUseProgram(program_quad);

        // When the type of internal state is boolean, zero integer or
        // floating-point values are converted to FALSE and non-zero
        // values are converted to TRUE

        glActiveTexture(GL_TEXTURE0); // Bind our texture in Texture Unit 0
        glUniform1i(renderedTexture_id, 0); // Set our "renderedTexture" sampler to use Texture Unit 0
        // fbo.color_tex = renderedTexture_id;
        fbo.BindColorTexture();

        glUniform1i(hf, half);
        glUniform1i(s, Size);


        // 1st attribute buffer : vertices
        glEnableVertexAttribArray(0);
        glBindBuffer(GL_ARRAY_BUFFER, quad_vertexbuffer);
        glVertexAttribPointer(0, // attribute 0. No particular reason for 0, but must match the layout in the shader.
                              3, // size
                              GL_FLOAT, // type
                              GL_FALSE, // normalized?
                              0, // stride
                              (void*)0 // array buffer offset
        );
        // Draw the triangles !
        glDrawArrays(GL_TRIANGLES, 0, 6); // 2*3 indices starting at 0 -> 2 triangles
        glDisableVertexAttribArray(0);
      }

      ImGui_ImplOpenGL3_NewFrame();
      ImGui_ImplGlfw_NewFrame();
      ImGui::NewFrame();

      ImGui::Begin("Options");
      ImGui::ColorEdit3("Ambient", col1);
      ImGui::ColorEdit3("Diffuse", col2);
      ImGui::ColorEdit3("Specular", col3);
      ImGui::SliderFloat("Light Intensity", &Light_Intense, -5.0, 5.0);
      ImGui::SliderFloat("Ambient Intensity", &Ambient_Intense, -1.0, 1.0);
      ImGui::SliderFloat("K", &K, -0.5, 4.0);
      ImGui::SliderFloat("Phong Constant", &n, -0.5, 3.0);
      ImGui::SliderFloat3("Light Position", lightpos, -30.0, 30.0);
      ImGui::SliderFloat3("Eye Position", eyepos, -30.0, 30.0);
      static bool check = false;
      ImGui::Checkbox("Halftone",&check);
      if(check){
        half = 1;
      }
      else{
        half = 0;
      }
      ImGui::Checkbox("Painter",&enable_painter_algorithm);


      ImGui::End();

      ImGui::Render();
      ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());


      // Swap buffers

    }

    glfwSwapBuffers(window);
    glfwPollEvents();

  } // Check if the ESC key was pressed or the window was closed
  while (glfwGetKey(window, GLFW_KEY_ESCAPE) != GLFW_PRESS && glfwWindowShouldClose(window) == 0);

  // Cleanup VBO and shader
  objects->Clear();
  fbo.Clear();
  glDeleteProgram(program_id);
  glDeleteBuffers(1, &quad_vertexbuffer);
  glDeleteProgram(program_quad);
  glDeleteTextures(1, &tex);
  glDeleteVertexArrays(1, &vao);
  glDeleteTextures(1, &TextureID);

  ImGui_ImplOpenGL3_Shutdown();
  ImGui_ImplGlfw_Shutdown();
  ImGui::DestroyContext();

  // Close OpenGL window and terminate GLFW
  glfwTerminate();

  delete objects;

  return 0;
}
