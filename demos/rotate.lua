-- Rotation Demo
-- Chelsea Thompto

-- How to rotate shapes around their position.

-- By default, the rotate() function will rotate things
-- around the top left corner of the screen. In order to 
-- change that, we need to use translate() which allows
-- us to move the origin point. If I move the origin
-- point to 100,100, then I can draw a shape at 0,0 and
-- it will be on the screen at the 100,100 location.


-- These variables are for the animation.
redRotation = 0
greenRotation = 0

require("L5")

function setup()
  size(400, 400)
  angleMode(DEGREES)
  -- This command treats rectangles like ellipses and
  -- measures from the center point.
  rectMode(CENTER)
  noStroke()
  windowTitle("For Loop 1")
  describe('White screen with green and blue circles')
  background(255)
  textSize(20)
  textAlign(CENTER)
end

function draw()
  background(255)

  -- Draw a black dot at the origin (0,0) point
  fill(0)
  ellipse(0,0,30,30)

  -- push() and pop() allow use to isolate a section
  -- of code. Here it will make sure only the red 
  -- square is rotated

  push()
  -- Rotate and draw a red square
  fill(255,25,0)
  rotate(redRotation)
  rect(100,100,100,100)
  pop()

  -- push() and pop() are used again here to have 
  -- the translate and rotation happen to only the 
  -- green and blue shapes.
  
  push()
  -- Move the origin point to (200,200)
  translate(200,200)
  rotate(greenRotation)
  -- draw the green square
  fill(10,255,10)
  rect(0,0,100,100)
  -- draw the blue dot
  fill(0,20,250)
  ellipse(0,0,30,30)
  pop()

  -- increase the rotation numbers to animate scene
  redRotation = redRotation + 1
  greenRotation = greenRotation + 1
end

