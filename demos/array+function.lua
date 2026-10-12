-- Array + Function
-- Chelsea Thompto

-- Pick a random element from an array/table

-- an array of string(text) values
pizzaToppings = {"onions.","tomatoes.","garlic.","pineapple."}
myText = "I want a pizza with "
myfontSize = 2

require("L5")

function setup()
    size(600, 400)
    angleMode(DEGREES)
    frameRate(60)
    windowTitle("Array +  Function")

    describe('Black background with white text.')

    background(0)
    textAlign(CENTER)
    textSize(30)
    -- using random and the array name to get a random element from the array
    sentenceBuilder(30)
    textGenerator()
end

function draw()
  -- pick a new random element and draw it every 2 seconds (60 frames per second times 2)
  if frameCount%120 == 0 then
    background(0)
    sentenceBuilder(myfontSize)
    myfontSize = myfontSize + 1
  end
end

function sentenceBuilder(fontSize)
  textSize(fontSize)
  text(myText..random(pizzaToppings), width/2, height/2)
  text("Even more text!",width/2, height*0.6)
end
