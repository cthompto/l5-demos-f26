-- Random Example 2
-- Chelsea Thompto

-- Pick a random element from an array/table

-- an array of string(text) values
pizzaToppings = {"onions","tomatoes","garlic","pineapple"}

require("L5")

function setup()
    size(600, 400)
    angleMode(DEGREES)
    frameRate(60)
    windowTitle("Random Example 2")

    describe('Black background with white text.')

    background(0)
    textAlign(CENTER)
    -- using random and the array name to get a random element from the array
    generateSentence(30)
    myfontSize = 0
end

function draw()
  -- pick a new random element and draw it every 2 seconds (60 frames per second times 2)
  if frameCount%60 == 0 then
    background(0)
    myfontSize = myfontSize + 1
    generateSentence(myfontSize)
  end
end

-- function to draw a new sentence with a new pizza topping
function generateSentence(thisSize)
  textSize(thisSize)
  text('I want a pizza with '..random(pizzaToppings).." please.", width/2, height/2)
end