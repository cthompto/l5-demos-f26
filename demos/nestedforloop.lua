-- Nested For Loop
-- Chelsea Thompto

-- Same as result as for loop 3 but with a nested loop
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

  fill(0)
  text("For Loop Grid:", width/2,30)

  -- set initial values
  x = 65
  y = 65

  -- loop to be run 9 times with another loop inside creating a 9x9 grid
  -- the i loop will 
  for i = 1, 9, 1 do
    -- the j loop starts at the top of the screen and draws boxes downward
    y = 65
    for j = 1, 9, 1 do
      -- this is modular arithmetic, it check to see if i/2 is 0, in other words
      -- it checks to see if the current i step is even and switches between black
      -- and white on evens and odds
      if (i+j)%2 == 0 then 
        fill(0)
      else
        fill(255)
      end

      -- a rectangle is drawn
      rect(x,y,30,30)

      --  this does the same as above but switches the black and white
      if (i+j)%2 == 0 then 
        fill(255)
      else
        fill(0)
      end

      -- an ellipse is drawn in the opposite color
      ellipse(x,y,10,10)

      -- this advances the y value
      y = y + 34;
    end
    -- once the loop ends, the column moves to the right and draws again
    -- eventually making a grid
    x = x + 34;
  end
end

