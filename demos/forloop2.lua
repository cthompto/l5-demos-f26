-- For Loop 2
-- Chelsea Thompto

-- Second for loop example using the loop step to change the code.
-- Reminder: A for loop repeats a section of code a set number of times.

require("L5")

function setup()
  size(600, 400)
  angleMode(DEGREES)
  rectMode(CENTER)
  noStroke()
  windowTitle("For Loop 1")
  describe('White screen with green and blue circles')
  background(255)
  textSize(20)
  textAlign(CENTER)
end

function draw()
  -- clear screen
  background(255)

  -- left side text
  fill(0)
  text("Linear Loop:",150,50)

  -- first for loop
  -- "i" is used in the fill and y positions to change them over each loop
  for i = 1, 10, 1 do
    -- i starts at one so the fill on the first step will be fill(25,100,100)
    fill(i*25,100,100)
    -- first i will have the y position at 90, the last will have it at 360
    ellipse(150,60+i*30,20,20)
  end

  -- middle line
  stroke(0)
  strokeWeight(3)
  line(width/2,0,width/2,height)
  noStroke()

  -- right side text
  fill(0)
  text("Radial Loop:",450,50)

  -- second for loop
  -- "i" is used in the fill and rotation to change them over time
  for i = 1, 12, 1 do
    push()
    translate(450,220)
    rotate(i*30)
    fill(100,i*21,100)
    rect(0,50,10,100)
    pop()
  end
end

