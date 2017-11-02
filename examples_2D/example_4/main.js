var regl = require('regl')()
var glsl = require('glslify')

const drawScreenFillQuad = regl({
  frag: glsl.file('./frag.glsl'),
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
  count: 6
})

regl.frame(function(data) {
  regl.clear({ color: [0,0,0,1], depth: true })
  drawScreenFillQuad()
})
