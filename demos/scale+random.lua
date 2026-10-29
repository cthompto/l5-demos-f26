-- Random Scaling Three Ways
-- Chelsea Thompto
-- Change Scale Every 3 Seconds

-- First option, using the scale() function to change an existing shape
-- Table below of scales 1 = 100%
scaleOptions = {0.5,0.75,1,1.25,1.5}

-- Second option, using number directing in the drawing function being used
sizeOptions = {25,50,75,100,125,150}

-- third option using a random range, starting value of 0 will change in setup
randomSize = 0

require("L5")

function setup()
  size(600, 400)
  windowTitle("Riso Demo 1")
  describe('Color Chart')
  background(87, 31, 78)
  rectMode(CENTER)
  frameRate(60)
  noStroke()
  textAlign(CENTER)
  textSize(20)

  -- choosing initial random values
  -- variable to hold the selected random scale for option 1
  currentScale = random(scaleOptions)

  -- variable to hold the selected random size for option 2
  currentSize = random(sizeOptions)

  -- variable to hold a randomly selected number for option 3
  -- making it a whole number so its cleaner to print on screen
  randomSize = round(random(50,150))

end

function draw()
  background(87, 31, 78)

  -- left rectangle
  push()
  translate(150,200)
  scale(currentScale)
  fill(146, 201, 177)
  rect(0,0, 100,100)
  pop()

  -- middle rectangle
  fill(79, 117, 155)
  rect(300,200,currentSize,currentSize)

  -- right rectangle
  fill(93, 81, 121)
  rect(450,200,randomSize,randomSize)

  -- display text above and current values beneath
  fill(162, 250, 163)
  textSize(24)
  text("Option 1:", 150, 100)
  text("Option 2:", 300, 100)
  text("Option 3:", 450, 100)
  textSize(16)
  text("Current Value: ", 150, 300)
  text(currentScale, 150, 325)
  text("Current Value: ", 300, 300)
  text(currentSize, 300, 325)
  text("Current Value: ", 450, 300)
  text(randomSize, 450, 325)

  -- choose a new size for each every 3 seconds
  if frameCount%120 == 0 then
    -- variable to hold the selected random scale for option 1
    currentScale = random(scaleOptions)

    -- variable to hold the selected random size for option 2
    currentSize = random(sizeOptions)

    -- variable to hold a randomly selected number for option 3
    -- rounding number for cleaner display on screen
    randomSize = round(random(50,150))
  end
end