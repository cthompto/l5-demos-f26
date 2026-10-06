-- Project 2 Example/Test1
-- Chelsea Thompto

--riso pink
risoPinkR = 255
risoPinkG = 72
risoPinkB = 176

--riso yellow
risoYellowR = 255
risoYellowG = 232
risoYellowB = 0

--alpha values
patternAlpha1 = 60
patternAlpha2 = 120
patternAlpha3 = 180
patternAlpha4 = 240

--pink/yellow
colorChoice = {"pink", "yellow"}

--alpha option arrays
baseAlpha = {patternAlpha2,patternAlpha3,patternAlpha4}
topAlpha = {patternAlpha1,patternAlpha2}

--shape options
bottomShape = {"blank","diamond","x","circle","diamond","x","circle"}
topShape = {"blank","diamond","x","circle","diamond","x","circle"}

--background options
backgroundShape = {"horizontal", "vertical", "circles", "squares"}

require("L5")

function setup()
  size(400, 600)
  angleMode(DEGREES)
  rectMode(CENTER)
  noStroke()
  windowTitle("---")

  describe('---')

  printStep = 0
  x = 50
  y = 50
  gridSize = 100

  background(255)
  --bgHorz()
  --bgVert()
  --bgCircles()
  --bgSquares()
  bgGen()
  gridGen()
end

function draw()
  
end

function mousePressed()
  --save('p2demo'..printStep..'.png')
  printStep = printStep + 1
  background(255)
  x = 50
  y = 50
  bgGen()
  gridGen()

end


function bgGen()
  bgShape = random(backgroundShape)
  if bgShape == "horizontal" then
    bgHorz()
  elseif bgShape == "vertical" then
    bgVert()
  elseif bgShape == "circles" then
    bgCircles()
  elseif bgShape == "squares" then
    bgSquares()
  else
  end
end

function gridGen()
  for i = 1, 24, 1 do
    -- base color
    graphicColor1 = random(colorChoice)
    graphicColor2 = random(baseAlpha)
    if graphicColor1 == "pink" then
      fill(risoPinkR,risoPinkG,risoPinkB,graphicColor2)
    else
      fill(risoYellowR,risoYellowG,risoYellowB,graphicColor2)
    end

    --base shape
    graphicBase = random(bottomShape)
    if graphicBase == "diamond" then
      baseDiamond(x,y)
    elseif graphicBase == "x" then
      baseCross(x,y)
    elseif graphicBase == "" then
      baseCircle(x,y)
    else
    end

    --top shape
    graphicColor3 = random(colorChoice)
    graphicColor4 = random(topAlpha)
    if graphicColor3 == "pink" then
      fill(risoPinkR,risoPinkG,risoPinkB,graphicColor4)
    else
      fill(risoYellowR,risoYellowG,risoYellowB,graphicColor4)
    end

    graphicBase2 = random(bottomShape)
    if graphicBase2 == "diamond" then
      baseDiamond(x,y)
    elseif graphicBase2 == "x" then
      baseCross(x,y)
    elseif graphicBase2 == "" then
      baseCircle(x,y)
    else
    end


    y = y + 100;
    if y >= height then
      y = 50;
      x = x + gridSize;
    end
  end
end

function baseDiamond(x,y)
  push()
  translate(x,y)
  rotate(45)
  rect(0,0,100,100)
  pop()
end

function baseCross(x,y)
  push()
  translate(x,y)
  rotate(45)
  rect(0,0,30,100)
  rect(-33,0,35,30)
  rect(33,0,35,30)
  pop()
end

function baseCircle(x,y)
  push()
  translate(x,y)
  ellipse(0,0,100,100)
  pop()
end

function midDiamond(x,y)
  push()
  translate(x,y)
  scale(0.5)
  rect(0,0,100,100)
  pop()
end

function midCross(x,y)
  push()
  translate(x,y)
  scale(0.5)
  rect(0,0,30,100)
  rect(-33,0,35,30)
  rect(32,0,35,30)
  pop()
end

function midCircle(x,y)
  push()
  translate(x,y)
  scale(0.5)
  ellipse(0,0,100,100)
  pop()
end

function topDiamond(x,y)
  push()
  translate(x,y)
  rotate(45)
  scale(0.25)
  rect(0,0,100,100)
  pop()
end

function topCross(x,y)
  push()
  translate(x,y)
  rotate(45)
  scale(0.25)
  rect(0,0,30,100)
  rect(-33,0,35,30)
  rect(32,0,35,30)
  pop()
end

function topCircle(x,y)
  push()
  translate(x,y)
  rotate(45)
  scale(0.25)
  ellipse(0,0,100,100)
  pop()
end

function bgHorz()
  background(255)

  for i = 1, 60, 1 do
    stroke(0,i*4)
    line(0,i*10,width,i*10)
  end
  noStroke()
end

function bgVert()
  background(255)

  for i = 1, 60, 1 do
    stroke(0,i*4)
    line(i*10,0,i*10,height)
  end
  noStroke()
end

function bgCircles()
  for i = 1, 100, 1 do
    stroke(0,i*2.5)
    fill(255)
    noFill()
    ellipse(width/2,height/2,10+i*10,10+i*10)
  end
  noStroke()
end

function bgSquares()
  for i = 1, 100, 1 do
    stroke(0,i*2.5)
    fill(255)
    noFill()
    push()
    translate(width/2,height/2)
    rotate(45)
    rect(0,0,10+i*10,10+i*10)
    pop()
  end
  noStroke()
end