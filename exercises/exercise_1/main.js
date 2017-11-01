var regl = require('regl')()
var glsl = require('glslify')

const drawScreenFillQuad = regl({
  frag: glsl.file('./frag_ex1.glsl'),
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
    u_time: regl.prop('time'),
    multiFrequency: regl.prop('multiFrequency'),
  },
  count: 6
})

regl.frame(function(data) {
  regl.clear({ color: [0,0,0,1], depth: true })
  drawScreenFillQuad({
    time: data.time,
    multiFrequency: [
      0.5,
      0.0,
      0.0
    ],
  })

})
