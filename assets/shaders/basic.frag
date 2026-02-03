#version 330 core

// Fragment shader for basic mesh rendering - outputs vertex color

in vec3 vertexColor;
out vec4 FragColor;

void main() {
    FragColor = vec4(vertexColor, 1.0);
}
