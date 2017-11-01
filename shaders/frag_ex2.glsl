#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;

void main(void) {
    vec2 st = gl_FragCoord.xy/u_resolution;
    //gl_FragColor = vec4(st.x, st.y, 0.0, 1.0);
    gl_FragColor = vec4(u_mouse.x, u_mouse.y, 0.0, 1.0);
}
