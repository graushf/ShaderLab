#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359
#define TWOPI 6.28318530718

// VOID. BLANK SCREEN.
//
// "main" function is called several times per second to produce
// the shader effect.
// The system aims to produce a speed of 60 frames per second (FPS).
// But if the GLSL script is computationally hard, then the frame rate
// drops. (You can read the frame rate at the info bar below the screen)
//
// Because we are not doing anything in the function
// this shader will produce a black screen
void main(void) {
    gl_FragColor = vec4(0.0,0.0,0.0,1.0);
}
