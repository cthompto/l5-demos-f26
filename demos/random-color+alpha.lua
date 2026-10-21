-- Random Color and Random Alpha Demo
-- Chelsea Thompto
-- Choosing a random color and then a random alpha.

--riso blue
risoBlueR = 0
risoBlueG = 120
risoBlueB = 191

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

--color option array
colorChoices = {"blue","pink", "yellow"}

--alpha option array
alphaChoices = {patternAlpha1,patternAlpha2,patternAlpha3,patternAlpha4}

require("L5")

function setup()
  size(400, 400)
  background(255)
  noStroke()
  rectMode(CENTER)
  windowTitle("Random Color / Random Alpha")
  describe('Gird of colorful dots.')

  --for loop to pick a random color and then a random alpha twice for each position. Nested for,loop creates a grid
  for i = 1, 9, 1 do
    for j = 1, 9, 1 do
      -- pick a random color and alpha and draw a circle
      currentColor = random(colorChoices)
      currentAlpha = random(alphaChoices)
      if currentColor == "blue" then
        fill(risoBlueR,risoBlueG,risoBlueB,currentAlpha)
      elseif currentColor == "pink" then
        fill(risoPinkR,risoPinkG,risoPinkB,currentAlpha)
      else
        fill(risoYellowR,risoYellowG, risoYellowB, currentAlpha)
      end
      ellipse(0+i*40,0+j*40,40,40)

      --pick a new random color and draw a square inside of the circle
      currentColor = random(colorChoices)
      currentAlpha = random(alphaChoices)
      if currentColor == "blue" then
        fill(risoBlueR,risoBlueG,risoBlueB,currentAlpha)
      elseif currentColor == "pink" then
        fill(risoPinkR,risoPinkG,risoPinkB,currentAlpha)
      else
        fill(risoYellowR,risoYellowG, risoYellowB, currentAlpha)
      end
      rect(0+i*40,0+j*40,28,28)
    end
  end
end

function draw()

end

-- repeat process on mouse press
function mousePressed()
  background(255)
  --for loop to pick a random color and then a random alpha twice for each position
  for i = 1, 9, 1 do
    for j = 1, 9, 1 do
      -- pick a random color and alpha and draw a circle
      currentColor = random(colorChoices)
      currentAlpha = random(alphaChoices)
      if currentColor == "blue" then
        fill(risoBlueR,risoBlueG,risoBlueB,currentAlpha)
      elseif currentColor == "pink" then
        fill(risoPinkR,risoPinkG,risoPinkB,currentAlpha)
      else
        fill(risoYellowR,risoYellowG, risoYellowB, currentAlpha)
      end
      ellipse(0+i*40,0+j*40,40,40)

      --pick a new random color and draw a square inside of the circle
      currentColor = random(colorChoices)
      currentAlpha = random(alphaChoices)
      if currentColor == "blue" then
        fill(risoBlueR,risoBlueG,risoBlueB,currentAlpha)
      elseif currentColor == "pink" then
        fill(risoPinkR,risoPinkG,risoPinkB,currentAlpha)
      else
        fill(risoYellowR,risoYellowG, risoYellowB, currentAlpha)
      end
      rect(0+i*40,0+j*40,28,28)
    end
  end
end