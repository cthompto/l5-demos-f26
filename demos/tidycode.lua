-- Tidy Code Demo
-- Chelsea Thompto
-- The indentations, formatting, naming conventions, and comments below are a guide

-- variable name for gray (notice it is a noun)
myGray = 125

require("L5")

-- setup program (notice items inside the function are indented once)
function setup()
  size(400, 400)
  windowTitle("If/Else Tidy Code Demo")
  noStroke()
  rectMode(CENTER)
end

-- this runs 60 times per second
function draw()
  background(240, 100, 30)
  -- run if and else checking functions see functions below draw
  colorPicker()
  shapePicker()
end

-- function name for chosing the color (notice it contains a verb)
function colorPicker()
  -- if, elseif, and else used to determine fill color, measures the cursor location on the y axis
  -- under one third is black, between one and two thirds is gray, over two thirds is white
  if mouseY < height*0.33 then
    fill(0) -- notice items inside an if that is inside of a function are indented twice
  elseif mouseY < height*0.66 then
    fill(myGray)
  else
    fill(255)
  end
end

function shapePicker()
  -- if and else used to determine shape, measures the cursor location on the x axis
  -- left of center is a circle, right of center is a square
  if mouseX < width/2 then
    ellipse(mouseX,mouseY,30,30)
  else
    rect(mouseX,mouseY,30,30)
  end
end