-- Image Pixel Demo 1
-- Chelsea Thompto

-- IN PROGRESS

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
  limit = ((width/10)*(height/10))
  x = 5
  y = 5
  for i=1, limit do
    g = get(x,y)
    print(g)
    newPixel = {
      color = g,
      x = x,
      y = y
    }
    table.insert(myPixels, newPixel)
    y = y + 10;
    if y == height+5 then
      y = 5;
      x = x + 10;
    end
    
  end
end

function draw()
 background(0)
 image(img, 0, 0, width, height)

 for i=1, #myPixels do
  if (mouseX - myPixels[i].x)*(mouseX - myPixels[i].x) + (mouseY - myPixels[i].y)*(mouseY - myPixels[i].y) >= 60*60 then
    fill(myPixels[i].color)
    rect(myPixels[i].x, myPixels[i].y, 10, 10)
  elseif (mouseX - myPixels[i].x)*(mouseX - myPixels[i].x) + (mouseY - myPixels[i].y)*(mouseY - myPixels[i].y) >= 50*50 then
    fill(myPixels[i].color[1],myPixels[i].color[2],myPixels[i].color[3],myPixels[i].color[4]-100)
    rect(myPixels[i].x, myPixels[i].y, 10, 10)
  end
 end

end


-- Things below here are notes, tests, and example code

--[[
if (mouseX - myPixels[i].x)*(mouseX - myPixels[i].x) + 
(mouseY - myPixels[i].y)*(mouseY - myPixels[i].y) <= 20*20 then



if ((x - circle_x) * (x - circle_x) +
        (y - circle_y) * (y - circle_y) <= rad * rad)


--
circles = {
  {x = 100, y = 100, speedX = 2, speedY = 1},
  {x = 200, y = 150, speedX = -1, speedY = 2},
  {x = 150, y = 200, speedX = 1, speedY = -2}
}

--

circles = {}

function setup()
  size(300, 300)

  -- Create 10 random circles
  for i = 1, 10 do
    newCircle = {
      x = random(width),
      y = random(height),
      speedX = random(-3, 3),
      speedY = random(-3, 3),
      size = random(10, 40)
    }
    table.insert(circles, newCircle)
  end
end

function draw()
   -- Draw circle
    circle(circles[i].x, circles[i].y, 30)
]]--