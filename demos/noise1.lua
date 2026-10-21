-- Noise Demo 1
-- Chelsea Thompto
-- Using noise to create more organic randomization.
-- Based on examples from: https://l5lua.org/reference/noise/#examples 

noiseAdvance = 0

require("L5")

function setup()
  size(400, 400)

  background(200)

  -- Set the noise level and scale.
  local noiseLevel = 255
  local noiseScale = 0.01

  -- Iterate from top to bottom.
  for y=1,height do
    -- Iterate from left to right.
    for x = 0,width do
      -- Scale the input coordinates.
      local nx = noiseScale * x
      local ny = noiseScale * y

      -- Compute the noise value.
      local c = noiseLevel * noise(nx, ny)

      -- Draw the point.
      stroke(c)
      point(x, y)
    end
  end
  windowTitle("Noise Demo 1")
  describe('A gray cloudy pattern.')
end

-- advance field with mouse click
function mousePressed()
   -- Set the noise level and scale.
  local noiseLevel = 255
  local noiseScale = 0.01
-- Iterate from top to bottom.
  for y=1,height do
    -- Iterate from left to right.
    for x = 0,width do
      -- Scale the input coordinates.
      local nx = noiseScale * x + noiseAdvance
      local ny = noiseScale * y + noiseAdvance

      -- Compute the noise value.
      local c = noiseLevel * noise(nx, ny)

      -- Draw the point.
      stroke(c,100)
      point(x, y)
    end
  end
  noiseAdvance = noiseAdvance + 1
end