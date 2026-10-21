-- Noise Demo 2
-- Chelsea Thompto
-- Using noise to create more organic randomization.
-- Based on examples from: https://l5lua.org/reference/noise/#examples 

require("L5")

function setup()
  size(400, 400)
  frameRate(60)
  background(200)

  -- Set the noise level and scale (try changing these!)
  -- changes the high point of the opacity, up to 255
  noiseLevel = 100
  -- changes the "size" of the pattern
  noiseScale = 0.004

  windowTitle("Noise Demo 2")
  describe('Pink and Blue Waves')
end

-- two fields of noise, one pink and one blue, interacting
function draw()

  -- blue field
  -- Iterate from top to bottom.
  for y=1,height do
    -- Iterate from left to right.
    for x = 0,width do
      -- Scale the input coordinates.
      local nx = noiseScale * x + frameCount*3
      local ny = noiseScale * y + frameCount*3

      -- Compute the noise value.
      local c = noiseLevel * noise(nx, ny)

      -- Draw the point.
      stroke(0, 120, 191,c)
      point(x, y)
    end
  end

  -- pink field
  for y=1,height do
    -- Iterate from left to right.
    for x = 0,width do
      -- Scale the input coordinates.
      local nx = noiseScale * x - frameCount*3
      local ny = noiseScale * y - frameCount*3

      -- Compute the noise value.
      local c = noiseLevel * noise(nx, ny)

      -- Draw the point.
      stroke(255, 72, 176,c)
      point(x, y)
    end
  end
  
end