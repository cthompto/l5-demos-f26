-- Alpha Demo
-- Chelsea Thompto

require("L5")

function setup()
  size(400, 400)
  windowTitle("Alpha Demo")
  describe('4 Dogs Images')
  angleMode(DEGREES)
  textAlign(CENTER)
  textSize(24)
  noStroke()
end

function draw()
  -- draw background
  background(255)

  -- blue dot 
  fill(0,0,255)
  ellipse(mouseX,mouseY,30,30)

  -- mostly transparent black field
  fill(0,50)
  rect(50,50,100,300)

  -- mostly opaque green field
  fill(20,240,20,230)
  rect(250,50,100,300)
end