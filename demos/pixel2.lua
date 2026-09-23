-- Image Pixel Demo 2
-- Chelsea Thompto

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
      y = y
    }
    table.insert(myPixels, newPixel)
    y = y + pixelSize;
    if y == height+(pixelSize/2) then
      y = pixelSize/2;
      x = x + pixelSize;
    end
  end

  spotX = 200
  spotY = 300
  moveX = random(-2,2)
  moveY = random(-2,2)

end

function draw()
  background(0)
  image(img, 0, 0, width, height)

  for i=1, #myPixels do
    if (spotX - myPixels[i].x)*(spotX - myPixels[i].x) + (spotY - myPixels[i].y)*(spotY - myPixels[i].y) >= 80*80 then
      fill(myPixels[i].color)
      rect(myPixels[i].x, myPixels[i].y, pixelSize, pixelSize)
    elseif (spotX - myPixels[i].x)*(spotX - myPixels[i].x) + (spotY - myPixels[i].y)*(spotY - myPixels[i].y) >= 70*70 then
      fill(myPixels[i].color[1],myPixels[i].color[2],myPixels[i].color[3],myPixels[i].color[4]-100)
      rect(myPixels[i].x, myPixels[i].y, pixelSize, pixelSize)
    end
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

end


-- Things below here are notes, tests, and example code

--[[



]]--