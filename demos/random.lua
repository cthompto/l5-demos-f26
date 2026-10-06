-- Random Example 1
-- Chelsea Thompto

--Draw loop is empty but needs to be written still

require("L5")

function setup()
    size(400, 400)
    angleMode(DEGREES)
    rectMode(CENTER)
    noStroke()
    windowTitle("---")

    describe('---')

    background(0)

    --for loop that populates random ovals in greyscale
    for i = 1, 200, 1 do
      fill(random(255))
      ellipse(random(50,350),random(50,350),random(10,50),random(10,50))
    end

    --example of assigning a random value to a variable and then applying it
    fill(random(255),random(255),random(255))
    rectX = random(100,300)
    rectY = random(100,300)
    rectSize = random(10,100)
    rect(rectX,rectY,rectSize,rectSize)
end

function draw()
    -- left empty because otherwise new random numbers would be chosen 60 times per second
end