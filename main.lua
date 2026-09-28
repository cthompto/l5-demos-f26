-- HW 5 Demo
-- Chelsea Thompto

-- invisible spots rotating pixels

require("L5")


function setup()
  size(600, 600)
  angleMode(DEGREES)
  windowTitle("Image Pixel Test")

  -- Describe the visual output
  describe('Draws a pixelated tree')

end

function draw()
  background(0)
  noStroke()
  fill(220,50,50)
  rect(width/2,height/2,width*0.5,height*0.50)

  fill(120,120,120)
  ellipse(mouseX,mouseY,width*0.2,height*0.1)
  ellipse(mouseX,mouseY-20,width*0.15,height*0.15)
  fill(255)
  ellipse(mouseX,mouseY-35,width*0.05,height*0.05)
end