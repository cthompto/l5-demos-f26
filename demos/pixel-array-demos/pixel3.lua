-- Image Pixel Demo 3
-- Chelsea Thompto

-- invisible spots rotating pixels

require("L5")

myPixels = {}

function setup()
  size(600, 900)
  angleMode(DEGREES)
  rectMode(CENTER)
  noStroke()
  windowTitle("Image Pixel Test")

  -- Describe the visual output
  describe('Draws a pixelated tree')

  img = loadImage('assets/red-leaf-600-900.jpg')
  image(img, 0, 0, width, height)

  -- generate pixel field
  pixelSize = 10
  limit = ((width/pixelSize)*(height/pixelSize))
  x = pixelSize/2
  y = pixelSize/2
  for i=1, limit do
    g = get(x,y)
    print(g)
    newPixel = {
      color = g,
      x = x,
      y = y,
      r = 0
    }
    table.insert(myPixels, newPixel)
    y = y + pixelSize;
    if y == height+(pixelSize/2) then
      y = pixelSize/2;
      x = x + pixelSize;
    end
  end

  spotX = 200
  spotY = 200
  moveX = random(-2,2)
  moveY = random(-2,2)

  spot2X = 200
  spot2Y = 400
  move2X = random(-2,2)
  move2Y = random(-2,2)

end

function draw()
  background(0)
  --image(img, 0, 0, width, height)

  for i=1, #myPixels do
    if (spotX - myPixels[i].x)*(spotX - myPixels[i].x) + (spotY - myPixels[i].y)*(spotY - myPixels[i].y) <= 180*180 then
      myPixels[i].r = myPixels[i].r + 1
    end
    if (spot2X - myPixels[i].x)*(spot2X - myPixels[i].x) + (spot2Y - myPixels[i].y)*(spot2Y - myPixels[i].y) <= 180*180 then
      myPixels[i].r = myPixels[i].r - 1
    end
    push()
    translate(myPixels[i].x, myPixels[i].y)
    rotate(myPixels[i].r)
    fill(myPixels[i].color)
    rect(0,0, pixelSize, pixelSize)
    pop()
  end


  spotX = spotX + moveX
  spotY = spotY + moveY

  if spotX <=0 then
    moveX = random(1,2)
  elseif spotX >= width then
    moveX = random(-1,-2)
  end

  if spotY <=0 then
    moveY = random(1,2)
  elseif spotY >= height then
    moveY = random(-1,-2)
  end

  spot2X = spot2X + move2X
  spot2Y = spot2Y + move2Y

  if spot2X <=0 then
    move2X = random(1,2)
  elseif spot2X >= width then
    move2X = random(-1,-2)
  end

  if spot2Y <=0 then
    move2Y = random(1,2)
  elseif spot2Y >= height then
    move2Y = random(-1,-2)
  end

end