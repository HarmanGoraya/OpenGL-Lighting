#version 330 core

// Input vertex data, different for all executions of this shader.
layout(location = 0) in vec3 vertexPosition_modelspace;
layout(location = 1) in vec2 vertexUV;
layout(location = 2) in vec3 vertexNormal_modelspace;

// Output data ; will be interpolated for each fragment.
out vec3 Normal_modelspace;
out vec3 color;
out vec2 UV;

// Values that stay constant for the whole mesh.
uniform mat4 MVP;
uniform vec3 Ka;
uniform vec3 Ks;
uniform mat4 MV;
uniform vec3 light_pos;
uniform vec3 eye_pos;
uniform sampler2D myTextureSampler;
uniform vec3 Kd;
uniform float K;
uniform float n;
float cons;


uniform float IL;
uniform float IA;


void main(){

    //https://learnopengl.com/Lighting/Basic-Lighting

    vec4 P = MV * vec4(vertexPosition_modelspace,1.0);
    vec3 N = mat3(MV) * vec3(vertexNormal_modelspace);
    vec3 L = light_pos - P.xyz;

    vec3 V = eye_pos - P.xyz;

    N = normalize(N);
    L = normalize(L);
    V = normalize(V);

    vec3 R = reflect(-L,N);


    //vec3 Kd = texture(myTextureSampler,vertexUV).rgb;

    //vec3 Kd = vec3(0.4,0.0,0.0);



    vec3 diffuse = max(dot(N,L),0.0) * Kd;

    vec3 specular = pow(max(dot(R,V),0.0),n) * Ks;


    vec3 ambient = Ka * IA;
    cons = IL / length(eye_pos - P.xyz) + K;

    specular = cons * specular;
    diffuse = cons * diffuse;

    color = ambient + diffuse + specular;

    gl_Position =  MVP * vec4(vertexPosition_modelspace,1);

    Normal_modelspace = normalize(vertexNormal_modelspace);

    UV = vertexUV;

}

