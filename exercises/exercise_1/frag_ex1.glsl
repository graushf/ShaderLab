#ifdef GL_ES
precision mediump float;
#endif

#define M_PI 3.1415926535897932384626433832795

uniform float u_time;
uniform float frequency;
uniform vec3 multiFrequency;

float calculateFreqz(float _frequency) {
    return u_time * M_PI * _frequency;
}

vec4 red() {
    return vec4(abs(sin(calculateFreqz(multiFrequency.x))), abs(sin(calculateFreqz(multiFrequency.y))), abs(sin(calculateFreqz(multiFrequency.z))), 1.0);
    //return vec4(abs(sin(u_time)), 0.0, 0.0, 1.0);
}

void main(void) {
    gl_FragColor = red();
}
