precision mediump float;
varying vec3 vpos, vnorm;
void main () {
  gl_FragColor = vec4(vnorm*vec3(1.0,0.0,0.0), 1.0);
}
