#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform float u_time;
uniform vec2 u_mouse;

float plot(vec2 st, float pct) {
    return smoothstep(pct - 0.02, pct, st.y) - smoothstep(pct, pct+0.02, st.y);
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;

    // Smooth interpolation between 0.1 and 0.9
    float x = st.x;
    float y = 0.5*(ceil(sin(x*2.0*PI)) + floor(sin(x*2.0*PI))) + 0.5;
    //y =  floor(0.5*(sin(x*3.0*PI)));

    vec3 color = vec3(y);

    float pct = plot(st,y);
    color = (1.0-pct)*vec3(1.0,1.0,1.0)+pct*vec3(1.0,0.0,0.0);

    gl_FragColor = vec4(color, 1.0);
}
