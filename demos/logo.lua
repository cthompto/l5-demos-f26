-- L5 Logo Demo
-- by Chelsea Thompto

-- this line connects the L5 library to the code we write
require("L5")

-- function to set up the canvas
function setup()
  size(600,400)
  windowTitle("L5 Logo Demo (RISO Colors)")
  rectMode(CENTER)
  angleMode(DEGREES)
  noStroke()
  frameRate(30)

  -- variables for semi circle and circle size and placement
  pixelSize = 20
  loopX = width/pixelSize
  loopY = height/pixelSize

  -- function run multiple times so it starts with gradient
  for i = 1, 5, 1 do
    -- function to generate random background graphics and fixed logo
    spotFill()
  end
  
end

-- draw loop for rendering and updating elements on the canvas
function draw()
  -- run new background generation every 1 second
  if frameCount%30 == 0 then
    spotFill()
  end
end

-- function for drawing the grid of shapes
function spotFill()
  -- semi translucent background for gradient colors
  background(255,255,255,100)

  -- nested for loop each the size of the window divided by the pixel size
  for i = 1, loopX, 1 do
    for j = 0, loopY, 1 do
      -- choosing a random color
      local thisColor
      local choice = random(4)
      if choice < 1 then
        thisColor = color(255,255,255)
      elseif choice <= 2 then
        thisColor = color(0,120,191)
      elseif choice <= 3 then
        thisColor = color(255,72,176)
      elseif choice <= 4 then
        thisColor = color(255,232,0)
      end
      fill(thisColor)

      -- choosing a random number for the shape
      local shape = random(4)

      -- l5 logo is placed here by overriding color and shape number
      -- (there is probably a more clever way to do this)
      if i > 10 and i < 21 then
        if j > 7 and j < 14 then
          if j == 8 and i == 12 then
            shape = 20
            fill(0);
          elseif j== 8 and i == 17 then
            shape = 20
            fill(0);
          elseif j== 8 and i == 18 then
            shape = 20
            fill(0);
          elseif j== 8 and i == 19 then
            shape = 20
            fill(0);
          elseif j== 8 and i == 20 then
            shape = 20
            fill(0);
          elseif j == 9 and i == 11 then
            shape = 20
            fill(0);
          elseif j == 9 and i == 12 then
            shape = 20
            fill(0);
          elseif j == 9 and i == 16 then
            shape = 20
            fill(0);
          elseif j == 9 and i == 17 then
            shape = 20
            fill(0);
          elseif j == 10 and i == 11 then
            shape = 20
            fill(0);
          elseif j == 10 and i == 12 then
            shape = 20
            fill(0);
          elseif j == 10 and i == 17 then
            shape = 20
            fill(0);
          elseif j == 10 and i == 18 then
            shape = 20
            fill(0);
          elseif j == 10 and i == 19 then
            shape = 20
            fill(0);
          elseif j == 11 and i == 11 then
            shape = 20
            fill(0);
          elseif j == 11 and i == 12 then
            shape = 20
            fill(0);
          elseif j == 11 and i == 19 then
            shape = 20
            fill(0);
          elseif j == 11 and i == 20 then
            shape = 20
            fill(0);
          elseif j == 12 and i == 11 then
            shape = 20
            fill(0);
          elseif j == 12 and i == 12 then
            shape = 20
            fill(0);
          elseif j == 12 and i == 16 then
            shape = 20
            fill(0);
          elseif j == 12 and i == 19 then
            shape = 20
            fill(0);
          elseif j == 12 and i == 20 then
            shape = 20
            fill(0);
          elseif j == 13 and i == 12 then
            shape = 20
            fill(0);
          elseif j == 13 and i == 13 then
            shape = 20
            fill(0);
          elseif j == 13 and i == 14 then
            shape = 20
            fill(0);
          elseif j == 13 and i == 17 then
            shape = 20
            fill(0);
          elseif j == 13 and i == 18 then
            shape = 20
            fill(0);
          elseif j == 13 and i == 19 then
            shape = 20
            fill(0);
          else 
          end
        end
      end

      -- draws shape depending on color and shape info 
      if shape < 1 then
        arc((i*pixelSize)-pixelSize/2,(j*pixelSize)-pixelSize/2,pixelSize,pixelSize,180,360)
      elseif shape < 2 then
        arc((i*pixelSize)-pixelSize/2,(j*pixelSize)-pixelSize/2,pixelSize,pixelSize,90,270)
      elseif shape < 3 then
        arc((i*pixelSize)-pixelSize/2,(j*pixelSize)-pixelSize/2,pixelSize,pixelSize,270,90)
      elseif shape < 4 then
        arc((i*pixelSize)-pixelSize/2,(j*pixelSize)-pixelSize/2,pixelSize,pixelSize,0,180)
      elseif shape == 20 then
        ellipse((i*pixelSize)-pixelSize/2,(j*pixelSize)-pixelSize/2,pixelSize,pixelSize)
      end
    end
  end
end