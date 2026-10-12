-- Mouse Position
-- Chelsea Thompto

require("L5")

function setup()
  size(800, 800)
  angleMode(DEGREES)
  windowTitle("Mouse Position Demo")

  -- Describe the visual output
  describe('Draws 3 basic shapes')

end

function draw()
  background(0)
  noStroke()

  -- create a rectangle in the top right quarter or the canvas
  fill(0,200,100)
  rect(width/2,0,width/2,height/2)

  -- user defined variables
  circleX = 100
  circleY = 200

  -- create two ovals at the point of the mouse
  fill(0,100,200)
  ellipse(mouseX,mouseY,circleX,circleY)
  fill(255)
  ellipse(mouseX,mouseY,circleX/2,circleY/2)
end