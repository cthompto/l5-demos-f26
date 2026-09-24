-- Anatomy of a Sketch
-- Chelsea Thompto

-- Connects L5 library to sketch code.
require("L5")

-- Function to set up sketch. (All functions end with an "end")
function setup()

  -- Sets window size.
  size(400, 400)
  
  -- Describes sketch visuals.
  windowTitle("Cursor Cords Demo")
end

-- Function to draw in the window. (Runs 30 times per second)
function draw()

  -- Fills the whole screen with a color. (Essential to avoid ghost images)
  background(140, 237, 237)

  -- A basic shape in white.
  fill(255)
  ellipse(200,200,100,100)

  -- The code below adds a cursor position for bebugging.
  fill(0)
  text("X: "..mouseX.."  Y: "..mouseY, mouseX+5,mouseY+30)
end
