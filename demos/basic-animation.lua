-- Basic Animation
-- Chelsea Thompto

-- variable to be used for oval x position
ovalX = -30

-- variable to be used for rectangle x position
rectX = -30

-- variable to be used for changing rectX
rectMove = 1

require("L5")

function setup()
  size(400, 400)
  windowTitle("Basic Animation Demo")
  noStroke()
  rectMode(CENTER)
end

function draw()
  background(140, 200, 130)

  -- Top Animation (Looping)
  fill(0)

  -- use variable in the ellipse function
  ellipse(ovalX,100,30,20)

  -- add one to the value of ovalX to move it to the right
  ovalX = ovalX+1

  -- check for value to be off the screen and reset
  if ovalX > width+30 then
    ovalX = -30
  end

  -- Bottom Animation (Bouncing)
  fill(255)

  -- use second variable in the rectangle function
  rect(rectX, 300, 30,40)

  -- change direction at the edge or the screen
  if rectX > width+30 or rectX < -30 then
    rectMove = rectMove * -1
  end

  -- use value to add or subject from position
  rectX = rectX+rectMove
end