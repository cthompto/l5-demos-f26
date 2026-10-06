-- For Loop 3
-- Chelsea Thompto

-- Third for loop example 
-- Reminder: A for loop repeats a section of code a set number of times.

require("L5")

function setup()
  size(400, 400)
  rectMode(CENTER)
  angleMode(DEGREES)
  noStroke()
  windowTitle("For Loop 1")
  describe('White screen with green and blue circles')
  background(255)
  textSize(20)
  textAlign(CENTER)
end

function draw()
  -- clear screen
  background(50,200,250)

  text("For Loop Grid:", width/2,30)

  -- set initial values
  x = 65
  y = 65

  -- loop to be run 81 times, creating a 9x9 grid
  for i = 1, 81, 1 do

    -- this is modular arithmetic, it check to see if i/2 is 0, in other words
    -- it checks to see if the current i step is even and switches between black
    -- and white on evens and odds
    if i%2 == 0 then
      fill(0)
    else
      fill(255)
    end

    -- a rectangle is drawn
    rect(x,y,30,30)

    -- this does the same as above but switches the black and white
    if i%2 == 0 then
      fill(255)
    else
      fill(0)
    end

    -- an ellipse is drawn in the opposite color
    ellipse(x,y,10,10)

    -- this advances the y value
    y = y + 34;

    -- when the y value gets to my desires height, it resets and moves the x
    -- this can also be done by nesting for loops
    if y >= 350 then
      y = 65;
      x = x + 34;
    end
  end
end