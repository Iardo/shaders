local path_color_cycle = 'shader/glsl/color-cycle.glsl'
local path_playground  = 'shader/glsl/playground.glsl'

local shader_color_cycle = love.graphics.newShader(path_color_cycle)
local shader_playground  = love.graphics.newShader(path_playground)

local shader = {
  color_cycle = shader_color_cycle,
  playground = shader_playground,
}

return shader
