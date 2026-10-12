-- Random + Nested Arrays + Timing
-- Chelsea Thompto

-- create an array/table of colors
myColors = {
  {r = 104,g = 42,b = 25},
  {r = 244,g = 242,b = 5},
  {r = 4,g = 142,b = 125},
  {r = 210,g = 210,b = 225}
}

require("L5")

function setup()
    size(600, 600)
    angleMode(DEGREES)
    rectMode(CENTER)
    textAlign(CENTER)
    frameRate(60)
    windowTitle("Random + Nested Arrays + Timing")
    describe('Black background with rotating circles')
    background(0)
    noStroke()

    -- initial rotation number
    rotNum = 0

    --[[
    Pick a random number between 0 and the number of elements in
    the array. This is done with random(#myColors). The "#" reads
    as "the length of the table" to the computer. Then, use the
    ceil() call which rounds up to the nearest whole number. In
    this case, this will result in a result of "1","2","3", or "4".
    ]]--
    currentColor = ceil(random(#myColors))
    currentColor2 = ceil(random(#myColors))
end

function draw()
  background(0)
  
  -- create 6 sets of 2 concentric circles
  for i = 1, 6, 1 do
    push()
    -- center the rotation to the canvas center
    translate(width/2,height/2)
    -- increase the rotation by 60 degrees every i, animate with rotNum
    rotate(i*60+rotNum)
    -- Draw the larger circle with a random number linked to a color set.
    -- This uses the random number generated for "currentColor2" and then refers to 
    -- the "r", "g", and "b" values within that.
    fill(myColors[currentColor2].r,myColors[currentColor2].g,myColors[currentColor2].b)
    -- offset y so circles orbit middle point
    ellipse(0,200,75,75)
    -- draw the smaller circle with a different random number (might be duplicated)
    fill(myColors[currentColor].r,myColors[currentColor].g,myColors[currentColor].b)
    ellipse(0,200,50,50)
    pop()
  end

  -- Pull the same values into a text call to display fill colors
  fill(255)
  text("Outer Circle Color: R:"..myColors[currentColor2].r.." G:"..myColors[currentColor2].g.." B:"..myColors[currentColor2].b, width/2, height*0.45)
  text("Inner Circle Color: R:"..myColors[currentColor].r.." G:"..myColors[currentColor].g.." B:"..myColors[currentColor].b, width/2, height*0.55)

  -- every loop, increase the rotation of call circles by 1 degree
  rotNum = rotNum + 1

  -- every 2 seconds, pick a new set of numbers for both circles
  if frameCount%120 == 0 then
    currentColor = ceil(random(#myColors))
    currentColor2 = ceil(random(#myColors))
  end
end