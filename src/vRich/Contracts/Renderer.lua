local Renderer = {}
Renderer.__index = Renderer

--[[
  Creates an instance of the renderer.

  @return vRich.Renderer
--]]
function Renderer.create()
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
  error('Renderer:color not implemented')
end

--[[
  Draws a line.

  @param int fromX
  @param int fromY
  @param int toX
  @param int toY

  @return void
--]]
function Renderer.__index:line(fromX, fromY, toX, toY)
  error('Renderer:line not implemented')
end

--[[
  Fills a polygon.

  @param object polygon

  @return void
--]]
function Renderer.__index:fill(polygon)
  error('Renderer:fill not implemented')
end

--[[
  Rotates the X axis.

  @param int degrees

  @return void
--]]
function Renderer.__index:rotate(degrees)
  error('Renderer:rotate not implemented')
end

vRich.Contracts.Renderer = Renderer
