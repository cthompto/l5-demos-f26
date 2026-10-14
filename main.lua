-- Super Parking Lot Simulator 4000
-- Chelsea Thompto

-- mini truck position
carX = 200
carY = 200

-- mini truck colors
carR = {255,255,0,2,242,252}
carG = {255,60,128,23,0,234}
carB = {255,25,38,214,210,25}
colorIndex = 1

-- off screen value
offScreen = false

require("L5")

function setup()
  size(400, 400)
  windowTitle("Super Parking Lot Simulator 4000")
  describe('A parking lot with a car.')
  rectMode(CENTER)
  angleMode(DEGREES)
  noStroke()
  background(255)
  textAlign(CENTER)
  textSize(30)
end

function draw()
  -- background color and parking lot lines
  background(85)
  fill(255)
  for i = 1, 18, 1 do
    if i < 10 then
      rect(25,i*40, 50, 5)
    else
      rect(375,760-(i*40), 50, 5)
    end
  end

  -- draw mini truck
  drawKeiTruck()

  -- move mini truck
  if keyIsPressed then
    if key == "left" then
      carX = carX - 1
      if carX < 25 then
        carX = 25
      end
    elseif key == "right" then
      carX = carX + 1
      if carX > 375 then
        carX = 375
      end
    elseif key == "up" then
      carY = carY - 1
    elseif key == "down" then
      carY = carY + 1
    end
  end

  -- check if mini truck is off screen
  if carY <= -20 or carY >= height+20 then
    offScreen = true
  else
    offScreen = false
  end

  -- if off screen, add message
  if offScreen then
    fill(255)
    text("Goodbye!!!", width/2,height/2)
  end

end
   
-- change truck color on mouse press
function mousePressed()
  colorIndex = colorIndex + 1
  if colorIndex > #carR then
    colorIndex = 1
  end
end

-- draw truck
function drawKeiTruck()
  push()
  translate(carX,carY)
  scale(0.5)
  fill(carR[colorIndex],carG[colorIndex],carB[colorIndex])
  rect(0, 0, 100, 30)
  rect(17,-20,34,60)
  triangle(33,-15,50,-15,33,-50)
  fill(0)
  rect(17,-30,24,30)
  triangle(30,-15,45,-15,30,-47)
  ellipse(-30,15,25,25)
  ellipse(30,15,25,25)
  fill(255)
  ellipse(-30,15,10,10)
  ellipse(30,15,10,10)
  pop()
end