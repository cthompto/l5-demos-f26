-- HW 5 Demo
-- Chelsea Thompto

-- invisible spots rotating pixels

require("L5")

myPixels = {}

function setup()
  size(1000, 1000)
  angleMode(DEGREES)
  windowTitle("Image Pixel Test")

  -- Describe the visual output
  describe('Draws a pixelated tree')

end

function draw()
  background(0)
  noStroke()
  fill(0,200,100)
  rect(width/2,0,width/2,height/2)

  -- user defined variables
  circleX = 100
  circleY = 200

  fill(0,100,200)
  ellipse(mouseX,mouseY,circleX,circleY)

  fill(255)
  ellipse(mouseX,mouseY,circleX/2,circleY/2)
end