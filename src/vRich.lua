vRich = {
  Contracts = {},
  Renderer = nil
}
vRich.__index = vRich

require('vRich.Contracts.Renderer')

--[[
  Creates a new vRich instance.

  @param vRich.Contracts.Renderer renderer

  @return vRich
--]]
vRich.create = function (renderer)
  local vrich = {}

  setmetatable(vrich, vRich)

  vrich.Renderer = renderer

  return vrich;
end
