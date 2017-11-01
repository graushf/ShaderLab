var regl = require('regl')()
var glsl = require('glslify')
const mouse = require('mouse-change')()
var vec2 = require('vec2')

var mouseScreen = new vec2(0.0, 0.0);

const drawScreenFillQuad = regl({
  frag: glsl.file('./frag_ex2.glsl'),
  vert: glsl.file('../../shaders/_vert.glsl'),
  attributes: {
    position: [
      [-1, 1],
      [1, 1],
      [-1, -1],
      [-1, -1],
      [1, 1],
      [1, -1]
    ]
  },
  uniforms: {
    u_resolution: regl.prop('u_resolution'),
    u_mouse: regl.prop('u_mouse')
  },
  count: 6
})

function convertToDeviceCoords(data) {
    mouseScreen.x = (mouse.x / data.viewportWidth);
    var aux = -1 * ((mouse.y / data.viewportHeight) - 1);
    if ( aux < 0) {
        mouseScreen.y = 0;
    } else {
        mouseScreen.y = aux;
    }
}

regl.frame(function(data) {
  regl.clear({ color: [0,0,0,1], depth: true })
  convertToDeviceCoords(data);
  drawScreenFillQuad({
    u_resolution: [data.viewportWidth, data.viewportHeight],
    u_mouse: [mouseScreen.x, mouseScreen.y]

  })
})
