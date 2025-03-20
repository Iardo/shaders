local lick = require 'lib.lick'
local shader = require 'global.shader'

local time = 0

function love.load()
  lick.reset = true
end

function love.draw()
  love.graphics.setShader(playground)
  love.graphics.rectangle('fill', 10,10,780,285)

  love.graphics.setShader(shader.color_cycle)
  love.graphics.rectangle('fill', 10,305,780,285)
end

function love.update(time_delta)
  time = time + time_delta
  shader.color_cycle:send("u_time", time)
  shader.playground:send("u_resolution", {780, 285})
end
