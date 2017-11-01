precision mediump float;
uniform mat4 projection, view;
attribute vec3 position;
varying vec3 vpos, vnorm;
void main() {
  vnorm = position;
  vpos = position + vnorm * 0.2;
  gl_Position = projection * view * vec4(vpos,1.0);
}
