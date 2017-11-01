#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float diff_plot = 0.00001;

// Plot a line of Y using a value between 0.0-1.0
float plot(vec2 st, float pct) {
    return smoothstep(pct-0.02, pct, st.y) - smoothstep( pct, pct+0.02, st.y);
}

float functionRet(int func_opt, float x)
{
    if (func_opt == 0) {
        return x;
    }
    if (func_opt == 1) {
        return pow(x, 5.0);
    }
    if (func_opt == 2) {
        return pow(x, 20.0);
    }
    if (func_opt == 3) {
        return pow(x, 2.0);
    }
    if (func_opt == 4) {
        return pow(x, 1.0);
    }
    if (func_opt == 5) {
        return pow(x, 0.0);
    }
    if (func_opt == 6) {
        return pow(x, 0.2);
    }
    if (func_opt == 7) {
        return pow(x, 0.02);
    }
    if (func_opt == 8) {
        return (exp(x) - 1.0);
    }
    if (func_opt == 9) {
        return (0.6 * ( -1.0*log(x) + 0.5));
    }
    if (func_opt == 10) {
        return log(x) + 1.0;
    }
    if (func_opt == 11) {
        return (0.5 * pow((x-0.5),1.0/5.0) + 0.5);
    }
}


void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;

    float y = functionRet(2, st.x);
    //y = st.x;

    vec3 color = vec3(y);

    // Plot a line
    float pct = plot(st, y);
    color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);
    //color = pct*vec3(0.0,1.0,0.0);

    gl_FragColor = vec4(color, 1.0);
    //gl_FragColor = vec4(st.x, st.y, 1.0, 1.0);
}
