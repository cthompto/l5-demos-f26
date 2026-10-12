-- Conditional Drawing + Randomization
-- Chelsea Thompto

-- Draw a word and shape based on an item in an array

-- define our array
myItems = {
  "Box",
  "Circle",
  "Line"
}

require("L5")

function setup()
  size(400, 400)
  windowTitle("Basic Animation Demo")
  noStroke()
  frameRate(60)
  rectMode(CENTER)
  angleMode(DEGREES)
  textAlign(CENTER)
  textSize(25)
  -- choose an item from the array
  myChoice = random(myItems)
end

function draw()
  background(0)
  fill(255)
  -- display the array item name chose
  text("Draw a "..myChoice, width/2, height*0.3)

  -- draw based on the array item chosen
  if myChoice == "Box" then
    noStroke()
    fill(200,10,200)
    rect(width/2,height*0.6, 100,100)
  elseif myChoice == "Circle" then
    noStroke()
    fill(10,200,200)
    ellipse(width/2,height*0.6, 100,100)
  elseif myChoice == "Line" then
    stroke(200,200,10)
    strokeWeight(10)
    line(width*0.25, height*0.6, width*0.75, height*0.6)
  end

  -- every 2 seconds pick a new item
  if frameCount%120 == 0 then
    myChoice = random(myItems)
  end
end