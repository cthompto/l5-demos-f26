-- Bezier Shape Demo
-- Chelsea Thompto

require("L5")

function setup()
  size(600, 400)
  windowTitle("Bezier Shape Demo")
  describe('Blue wave on.')
  background(255)
  noStroke()
end

function draw()
  background(255)
  
  -- Bezier curves repeated with not stroke to make a wave
  fill('blue')
  for i = 1, 8, 1 do
    bezier(-75+i*100, 360, -230+i*100, 450, 180+i*100, 450, -75+i*100, 360)
  end

  -- these could be animated by combining with the random target demo
end