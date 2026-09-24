-- Cursor Cords
-- Chelsea Thompto

require("L5")

function setup()
  size(400, 400)

  windowTitle("Cursor Cords Demo")
  
end

function draw()
  background(140, 237, 237)
  -- the code below adds the cursor position for bebugging
  fill(0)
  text("X: "..mouseX.."  Y: "..mouseY, mouseX+5,mouseY+30)
end