-- If/Else
-- Chelsea Thompto

require("L5")

function setup()
  size(400, 400)
  windowTitle("If/Else Demo")
  noStroke()
  rectMode(CENTER)
end

function draw()
  background(240, 100, 30)

  -- if, elseif, and else used to determine fill color
  if mouseY < width*0.33 then
    fill(0)
  elseif mouseY < width*0.66 then
    fill(125)
  else
    fill(255)
  end
  
  -- if and else used to determine shape
  if mouseX < width/2 then
    ellipse(mouseX,mouseY,30,30)
  else
    rect(mouseX,mouseY,30,30)
  end
end