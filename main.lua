-- Homework 4 Demo
-- Chelsea Thompto

require("L5")

-- function to setup sketch
function setup()
  -- Set window size and angle units
  size(400, 600)
  angleMode(DEGREES)

  -- Set the program title
  windowTitle("Homework 4 Demo")

  -- Describe the visual output
  describe('Draws a tree')
end

-- draw loop, runs 30 times per second by default
function draw()
  -- Code below renders the tree in shapes

  -- Remember the drawing order:
  -- Things draw from top to bottom. So something
  -- drawn on line 20 will be drawn over by 
  -- something on line 24.

  -- comment or uncomment the line below to see outlines
  noStroke()

  -- The background color, this should always be first
  -- in the drawing order.
  background(140, 237, 237)

  -- Draw the ground
  -- Fill defines the color.
  fill(235,216,91)
  -- "rect" is the shape to draw.
  rect(0,420,400,180)

  -- Draw clouds
  fill(211,238,240)
  -- left cloud
  ellipse(100,150,75,50)
  ellipse(75,140,70,40)
  ellipse(110,130,85,40)
  ellipse(135,145,55,40)

  -- top right cloud
  ellipse(310,70,110,50)
  ellipse(300,60,80,40)
  ellipse(340,80,70,30)


  -- Draw trunk
  fill(77,51,26)
  triangle(200,250,175,450,225,450)

  -- Draw trunk highlight
  fill(107,71,36)
  triangle(200,250,175,450,210,450)

  -- Draw main canopy
  fill(26,77,29)
  ellipse(200,260,150,320)

  -- Draw highlight canopy
  fill(45,133,51)
  -- This one is a little different, "push" and "pop" are
  -- used along with "translate" and "rotate" to rotate 
  -- the shape. 
  push()
  translate(190,240)
  rotate(5)
  ellipse(0,0,130,280)
  pop()

  -- Draw road
  fill(84,84,84)
  quad(150,420,160,420,0,580,0,490)

  -- Draw sign poll
  stroke(0)
  strokeWeight(1)
  line(30,470,30,400)

  -- Draw sign
  fill(255)
  rect(15,390,30,10)
end