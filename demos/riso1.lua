-- Riso Demo 1
-- Chelsea Thompto

blueOffX = 0
pinkOffY = 0
yellowRot = 0

require("L5")

function setup()
  size(600, 400)
  windowTitle("Riso Demo 1")
  describe('Color Chart')
  angleMode(DEGREES)
  
  textSize(18)
  noStroke()
end

function draw()
  -- draw background
  background(255)

  drawFramingGraphics()


  blueDraw()
  pinkDraw()
  yellowDraw()

  keyboardControls()
end

function drawFramingGraphics()
  textAlign(LEFT)
  noFill()
  stroke(0)
  rect(275,100,250,250)
  fill(0)
  textSize(24)
  text('Moving Riso Color Chart', 10, 30)
  textSize(18)
  text('Controls:', 10, 70)
  textSize(12)
  text('"A" and "d" keys:', 10, 100)
  text('- Rotates yellow', 20, 120)
  text('Mouse Move:', 10, 150)
  text('- Moves yellow', 20, 170)
  text('"Left" and "right" keys:', 10, 200)
  text('- Moves blue.', 20, 220)
  text('"Up" and "down" keys:', 10, 250)
  text('- Moves pink.', 20, 270)
end

function blueDraw()
  textAlign(CENTER)
  textSize(18)
  noStroke()
  for i = 1, 10, 1 do
    fill(0, 120, 191,i*25)
    rect(275+blueOffX, 75+i*25, 250, 25)
  end
  for i = 1, 10, 1 do
    fill(0, 120, 191)
    text((i*10).."%", 245+blueOffX, 95+i*25)
  end 
end

function pinkDraw()
  textAlign(CENTER)
  textSize(18)
  noStroke()
  for i = 1, 10, 1 do
    fill(255, 72, 176,i*25)
    rect(250+i*25, 100+pinkOffY, 25, 250)
  end
  for i = 1, 10, 1 do
    fill(255, 72, 176)
    push()
    translate(255+i*25, 70+pinkOffY)
    rotate(90)
    text((i*10).."%", 0,0 )
    pop()
  end 
end

function yellowDraw()
  textAlign(CENTER)
  textSize(18)
  noStroke()
  push()
  translate(mouseX,mouseY)
  rotate(yellowRot)
  for i = 1, 10, 1 do
    fill(255, 232, 0,255-(i*25))
    rect(-125, -150+i*25, 250, 25)
  end
  for i = 1, 10, 1 do
    fill(255, 232, 0)
    text((i*10).."%", 155, 145-i*25)
  end 
  pop()
end

function keyboardControls()
  if keyIsPressed then
    if key == "left" then
      blueOffX = blueOffX - 1
    elseif key == "right" then
      blueOffX = blueOffX + 1
    elseif key == "down" then
      pinkOffY = pinkOffY + 1
    elseif key == "up" then
      pinkOffY = pinkOffY - 1
    elseif key == "a" then
      yellowRot = yellowRot - 1
    elseif key == "d" then
      yellowRot = yellowRot + 1
    end
  end
end