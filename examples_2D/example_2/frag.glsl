#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359
#define TWOPI 6.28318530718

// "fragColor" is the output variable of the shader.
// Its value determines the image on the screen.
// This shaders sets its value to be the yellow color.

void main(void) {
    gl_FragColor = vec4(1.0,1.0,0.0,1.0);
}
