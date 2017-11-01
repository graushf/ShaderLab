var regl = require('regl')()
var glsl = require('glslify')

const drawScreenFillQuad = regl({
  frag: glsl.file('./frag_ex12.glsl'),
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
      u_time: regl.prop('time')
  },
  count: 6
})

regl.frame(function(data) {
  regl.clear({ color: [0,0,0,1], depth: true })
  drawScreenFillQuad({
    time: data.time,
    u_resolution: [data.viewportWidth, data.viewportHeight]
  })

})
