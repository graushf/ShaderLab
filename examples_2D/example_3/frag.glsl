#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359
#define TWOPI 6.28318530718

// "fragColor" should be assigned a vec4 object, which is made
// of four numbers between 0 and 1.
// First three numbers determines the color, and fourth number
// determines the opacity.
// (For now changing the transparency value will have no effect)
// A "vec4" data object can be constructed by giving 4 "float" arguments,
// or one "vec3" and one "float" argument.

void main(void) {
    // Here we are separating the color and transparency parts
    // of the vec4 that represents the pixels.
    vec3 color = vec3(0.0, 1.0, 1.0);
    float alpha = 1.0;

    vec4 pixel = vec4(color, alpha);
    gl_FragColor = pixel;
}
