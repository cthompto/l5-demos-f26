-- hw 6 demo
-- Chelsea Thompto

-- for oval rotation
ovalRotation1 = 0
ovalRotation2 = 0

-- for dot size
dotSize = 1
dotChange = 0.5

-- for background bars
rectY = -100
rectY2 = 500

require("L5")

function setup()
  size(400, 400)
  windowTitle("Basic Animation Demo")
  noStroke()
  rectMode(CENTER)
  angleMode(DEGREES)
end

function draw()
  background(218, 89, 245)

  -- pink
  fill(173, 71, 169)

  -- background bars

  rect(width/2,rectY,width,height/4)
  rectY = rectY + 0.5
  
  if rectY > height*1.25 then
    rectY = -100
  end

  rect(width/2,rectY2,width,height/4)
  rectY2 = rectY2 - 0.5
  
  if rectY2 < -100 then
    rectY2 = 500
  end

  -- green
  fill(66, 245, 87)

  -- top left
  push()
  translate(width/4,height/4)
  rotate(ovalRotation1)
  ellipse(0,0,width/2,height/4)
  pop()

  push()
  translate(width/4,height/4)
  rotate(ovalRotation2)
  ellipse(0,0,width/2,height/4)
  pop()

  -- top right
  push()
  translate(width*0.75,height/4)
  rotate(ovalRotation1)
  ellipse(0,0,width/2,height/4)
  pop()

  push()
  translate(width*0.75,height/4)
  rotate(ovalRotation2)
  ellipse(0,0,width/2,height/4)
  pop()

  -- bottom left
  push()
  translate(width/4,height*0.75)
  rotate(ovalRotation1)
  ellipse(0,0,width/2,height/4)
  pop()

  push()
  translate(width/4,height*0.75)
  rotate(ovalRotation2)
  ellipse(0,0,width/2,height/4)
  pop()

  -- bottom right
   push()
  translate(width*0.75,height*0.75)
  rotate(ovalRotation1)
  ellipse(0,0,width/2,height/4)
  pop()

  push()
  translate(width*0.75,height*0.75)
  rotate(ovalRotation2)
  ellipse(0,0,width/2,height/4)
  pop()

  -- dot detail

  -- cyan
  fill(32, 247, 240)
  ellipse(width*0.25, height*0.25, dotSize, dotSize)
  ellipse(width*0.25, height*0.75, dotSize, dotSize)
  ellipse(width*0.75, height*0.25, dotSize, dotSize)
  ellipse(width*0.75, height*0.75, dotSize, dotSize)

  -- rotate ovals
  ovalRotation1 = ovalRotation1 + 1
  ovalRotation2 = ovalRotation2 - 1


  -- change dot size
  if dotSize > 100 or dotSize < 1 then
    dotChange = dotChange * -1
  end

  dotSize = dotSize + dotChange

end