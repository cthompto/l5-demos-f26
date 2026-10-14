-- Drawing Machine Demo
-- Chelsea Thompto

-- variables for brush changes
myBrush = "oval"
brushR = 200
brushG = 30
brushB = 200
swirlRotation = 0
sprayX = 0
sprayY = 0
spraySize = 1

-- variable for file number incrementing
fileNumber = 0

-- variable for checking if an initial key has been pressed
startPress = false

require("L5")

function setup()
  size(800, 600)
  windowTitle("Drawing Machine Demo")
  describe('White background to draw on.')
  rectMode(CENTER)
  angleMode(DEGREES)

  -- initial scene 
  homeScreen()
end

function draw()
  -- check to see that an initial key has been pressed and then draw a shape based on current brush
  if startPress then
    if mouseIsPressed then
      fill(brushR, brushG, brushB)
      if myBrush == "oval" then
        ellipse(mouseX, mouseY, 20, 40)
      elseif myBrush == "square" then
        rect(mouseX, mouseY, 20, 20)
      elseif myBrush == "bar" then
        rect(mouseX, mouseY, 50, 10)
      elseif myBrush == "swirl" then
        swirlRotation= swirlRotation + 2
        push()
        translate(mouseX, mouseY)
        rotate(swirlRotation)
        ellipse(-30 , 0, 5, 5)
        ellipse(-20 , 0, 5, 5)
        ellipse(-10 , 0, 5, 5)
        ellipse(0 , 0, 5, 5)
        ellipse(10 , 0, 5, 5)
        ellipse(20 , 0, 5, 5)
        ellipse(30 , 0, 5, 5)
        pop()
      elseif myBrush == "spray" then
        sprayX = random(-20,20)
        sprayY = random(-20,20)
        spraySize = random(1,4)
        push()
        translate(mouseX,mouseY)
        ellipse(sprayX,sprayY,spraySize,spraySize)
        pop()
      end
    end
  end
end

function keyPressed()
  -- starts drawing space if no key has been pressed yet, otherwise actions are determined by a key
  if startPress then
    if key == "c" then
      background(255)
    elseif key == "s" then
      save("mydrawing"..fileNumber)
      fileNumber = fileNumber + 1
    elseif key == "r" then
      brushR = random(255)
      brushG = random(255)
      brushB = random(255)
    elseif key == "1" then
      myBrush = "oval"
    elseif key == "2" then
      myBrush = "square"
    elseif key == "3" then
      myBrush = "bar"
    elseif key == "4" then
      myBrush = "swirl"
    elseif key == "5" then
      myBrush = "spray"
    elseif key == "q" then
      startPress = false
      homeScreen()
    end
  else
    background(255)
    startPress = true
  end
end

-- home screen graphics
function homeScreen()
  background(255)
  noStroke()
  fill(0)
  textAlign(CENTER)
  textSize(30)
  text("Drawing Machine!", width/2, height*0.3)
  textSize(20)
  text("Instructions:", width/2, height*0.4)
  text("Number keys 1-5 change brush.", width/2, height*0.45)
  text("'S' saves, 'C' clears, and 'R' selects a new random color.", width/2, height*0.5)
  text("'Q' clears drawing and returns to this screen", width/2, height*0.55)
  text("Press Any Key to Start", width/2, height*0.70)
end