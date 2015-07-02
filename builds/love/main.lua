package.path = './src/?.lua;' .. package.path

local sub, rep, format = string.sub, string.rep, string.format

function prettystring(data)
  if type(data) == "string" then
    return format("%q", data)
  else
    return tostring(data)
  end
end

function tabletostring(t, indent, done)
  done = done or {}
  indent = indent or 0
  local str, cnt = "", 0

  for key, value in pairs(t) do
    str = str .. rep ("    ", indent)

    if type(value) == "table" and not done[value] then
      done[value] = true

      local ts = tostring(value)
      if ts:sub(1, 9) == "table: 0x" then
        local _str, _cnt = tabletostring(value, indent + 1, done)

        str = str .. prettystring(key) .. ":" .. ((_cnt > 0) and ("\n" .. _str) or " empty table\n")
      else
        str = str .. prettystring(key) .. " = " .. ts .. "\n"
      end
    else
      str = str .. prettystring(key) .. " = " .. prettystring(value) .. "\n"
    end

    cnt = cnt + 1
  end

  return str, cnt
end

require 'vRich';

local vRichInstance = vRich.create(require 'vRich.Adapters.LOVE.Renderer')
local renderer = vRichInstance.Renderer

function love.draw()
  renderer:color(255, 0, 0)

  renderer:line(0 - 16, 0, 800 - 16, 600)
  renderer:line(0 + 16, 0, 800 + 16, 600)
  renderer:line({0 - 16, 600, 800 - 16, 0})
  renderer:line({0 + 16, 600, 800 + 16, 0})

  renderer:color(0, 128, 0, 128)

  renderer:fill({
    0, 600,
    800, 600,
    800, 0
  })

  math.randomseed(1337)
  for i=1,12 do
    renderer:rotate(30)

    math.randomseed(i);

    renderer:color(math.random(0, 255), math.random(0, 255), math.random(0, 255), 128)

    renderer:fill({
      0, 600,
      800, 600,
      800, 0
    })
  end
end
