#version 330 core

in vec2 UV;


out vec3 color;

uniform sampler2D renderedTexture;
uniform int halftone;
uniform int size;


vec2 coords[9];
vec2 pixel;
vec2 where;
vec2 where2;
vec2 start;

vec3 avgcolor;


void main(){

    where = vec2(int(gl_FragCoord.x - 0.5) % 3,int(gl_FragCoord.y - 0.5) % 3);



    where2 = vec2(int(UV.x * 1600) % 3, int(UV.y * 1600) % 3);


    int x = int(where.x);
    int y = int(where.y);



    float dxtex = 1.0/float(textureSize(renderedTexture,0));
    float dytex = 1.0/float(textureSize(renderedTexture,0));


    pixel = vec2(gl_FragCoord.x - 0.5 - x,gl_FragCoord.y - 0.5 - y);

    //http://www.lighthouse3d.com/opengl/ledshader/index.php?page3

    coords[0] = pixel;
    coords[1] = vec2((pixel.x + 1) * 1/size,(pixel.y) * 1/size);
    coords[2] = vec2((pixel.x + 2) * 1/size,(pixel.y) * 1/size);
    coords[3] = vec2((pixel.x + 1) * 1/size,(pixel.y + 1) * 1/size);
    coords[4] = vec2((pixel.x + 1)  * 1/size,(pixel.y + 2) * 1/size);
    coords[5] = vec2((pixel.x + 2) * 1/size,(pixel.y + 1) * 1/size);
    coords[6] = vec2((pixel.x + 2) * 1/size,(pixel.y + 2) * 1/size);
    coords[7] = vec2((pixel.x) * 1/size,(pixel.y + 1) * 1/size);
    coords[8] = vec2((pixel.x) * 1/size,(pixel.y + 2)*1/size);

    avgcolor = texture(renderedTexture, coords[0] + UV.st).xyz
                + texture(renderedTexture, coords[1] + UV.st).xyz
                + texture(renderedTexture, coords[2] + UV.st).xyz
                + texture(renderedTexture, coords[3] + UV.st).xyz
                + texture(renderedTexture, coords[4] + UV.st).xyz
                + texture(renderedTexture, coords[5] + UV.st).xyz
                + texture(renderedTexture, coords[6] + UV.st).xyz
                + texture(renderedTexture, coords[7] + UV.st).xyz
                + texture(renderedTexture, coords[8] + UV.st).xyz;


    avgcolor = avgcolor/9.0;

    float red = avgcolor.r;
    float green = avgcolor.g;
    float blue = avgcolor.b;

    float m = max(red,green);
    m = max(m,blue);

    float on = 9.0 * m;

    float red_num = round(on * (red/(red+green+blue)));
    float green_num = round(on * (green/(red+green+blue)));
    float blue_num = round(on * (blue/(red+green+blue)));

    float red_intensity = red_num * (1.0/10.0);
    float green_intensity = green_num * (1.0/10.0);
    float blue_intensity = blue_num * (1.0/10.0);

    if(halftone == 1){
        color.x = red_intensity;
        color.y = green_intensity;
        color.z = blue_intensity;
    }

   else{
        color = texture(renderedTexture,UV).xyz;
    }

    //color = texture(renderedTexture,UV).xyz;
    //color = avgcolor;

    //color = vec3(red_intensity,green_intensity,blue_intensity);





}