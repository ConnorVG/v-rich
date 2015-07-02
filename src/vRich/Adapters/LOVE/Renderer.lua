local line, color, fill, fillMode, rotate, translate, radians = love.graphics.line, love.graphics.setColor, love.graphics.polygon, 'fill', love.graphics.rotate, love.graphics.translate, math.rad

local Renderer = {}
setmetatable(Renderer, vRich.Contracts.Renderer)
Renderer.__index = Renderer

--[[
  Creates an instance of the LÖVE renderer.

  @return vRich.Adapters.LOVE.Renderer
--]]
Renderer.create = function ()
  local renderer = {}

  setmetatable(renderer, Renderer)

  return renderer
end

--[[
  Sets the colour.

  @param int r
  @param int g
  @param int b
  @param int a

  @return void
--]]
function Renderer.__index:color(r, g, b, a)
  color(r, g, b, a or 255)
end

--[[
  Draws a line.

  @param object|... points

  @return void
--]]
function Renderer.__index:line(...)
  local points = {...}

  if (#points == 0) then
    return
  end

  if (#points == 1) then
    points = points[1]
  end

  if (#points < 4 or #points % 2 == 1) then
    error('Renderer:line not enough coordinates')
  end

  line(unpack(points))
end

--[[
  Fills a polygon.

  @param object|... polygon

  @return void
--]]
function Renderer.__index:fill(...)
  local points = {...}

  if (#points == 0) then
    return
  end

  if (#points == 1) then
    points = points[1]
  end

  if (#points < 6 or #points % 2 == 1) then
    error('Renderer:line not enough coordinates')
  end

  fill(fillMode, unpack(points))
end

--[[
  Rotates the X axis.

  @param int degrees

  @return void
--]]
function Renderer.__index:rotate(degrees)
  rotate(radians(degrees))
end

return Renderer
