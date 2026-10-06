-- For Loop 1
-- Chelsea Thompto

-- First for loop example combining the random function and a for loop
-- A for loop repeats a section of code a set number of times.
-- It is good for doing a lot of the same thing or things that change in a set way.

require("L5")

function setup()
  size(600, 400)
  noStroke()
  windowTitle("For Loop 1")
  describe('White screen with green and blue circles')
  background(255)

  -- this is the for loop, the setup contains a few key parts
  -- first: "for i = 1," this initializes the counter
  -- second: " 10," this is the number of times to repeat
  -- third: "1 do" this is the amount to move every step 
  -- fourth: the code to be run
  -- fifth: "end" 
  for i = 1, 10, 1 do
    fill(random(100),random(100,255),random(100,255))
    ellipse(random(100,500),random(100,300),50,50)
  end
end

function draw()
  --intentionally empty
end

-- same code from setup triggers on mouse press
-- press mouse to iterate options
-- prior result will fade with each click
function mousePressed()
  background(255,200)
  for i = 1, 10, 1 do
    fill(random(100),random(100,255),random(100,255))
    ellipse(random(100,500),random(100,300),50,50)
  end
end