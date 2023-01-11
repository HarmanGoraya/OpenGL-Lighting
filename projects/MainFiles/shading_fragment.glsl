#version 330 core

// Interpolated values from the vertex shaders
in vec3 Normal_modelspace;
in vec3 color;
in vec2 UV;

uniform vec3 objcolor;
uniform vec3 lightcolor;
uniform float ambientstrength;
uniform vec3 ambient;

// Ouput data
out vec4 outcolor;


void main(){




	//color = Normal_modelspace * 0.5 + 0.5;

	outcolor = vec4(color,1.0);



}
