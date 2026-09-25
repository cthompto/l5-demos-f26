-- Image Pixel Demo 1
-- Chelsea Thompto

-- display grid of pixels from an image

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
end

function draw()
 background(0)
 image(img, 0, 0, width, height)

 for i=1, #myPixels do
  if (mouseX - myPixels[i].x)*(mouseX - myPixels[i].x) + (mouseY - myPixels[i].y)*(mouseY - myPixels[i].y) <= 50*50 then
    fill(myPixels[i].color)
    rect(myPixels[i].x, myPixels[i].y, pixelSize, pixelSize)
  elseif (mouseX - myPixels[i].x)*(mouseX - myPixels[i].x) + (mouseY - myPixels[i].y)*(mouseY - myPixels[i].y) <= 60*60 then
    fill(myPixels[i].color[1],myPixels[i].color[2],myPixels[i].color[3],myPixels[i].color[4]-100)
    rect(myPixels[i].x, myPixels[i].y, pixelSize, pixelSize)
  end
 end

end


-- Things below here are notes, tests, and example code

--[[



]]--