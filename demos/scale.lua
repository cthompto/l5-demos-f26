-- Scale Example
-- Chelsea Thompto

--[[ 
Explanation:
The scale() function will shrink or expand a shape. It does
so around the origin point (the 0,0 point) of the sketch. 
By default the origin point is in the top left of the canvas.
This means that if I make a triangle in the center of the 
screen and I scale it down, it will get smaller while also 
being pulled towards the origin point of the canvas; the top
left. 

In order to prevent this, I have to decided the point around 
which I want the shape to grow or shrink and change the origin 
point to that point using translate(). 

So, in the example below, I wanted the triangle to shrink around
the center of the canvas. So, I had to use translate function 
and then recalculate where the triangle points would be with the
center as the 0,0 point. 

The sketch below illlustrates this whole process. The grey triangle
is the orginal triangle before scaling. The white triangle is the 
triangle after scaling without moving the origin point, and the 
purple triangle is the scaled triangle with the origin moved.
]]--

require("L5")

function setup()
    size(400, 400)
    angleMode(DEGREES)
    rectMode(CENTER)
    noStroke()
    windowTitle("Scale Example")

    -- Describe the visual output
    describe('Scaled Triangles')

end

function draw()
  background(0)

  --initial triangle to be resized 
  --(grey triangle)
  fill(125)
  triangle(200,100,300,300,100,300)

  --scaling without translating the origin
  push()
  scale(0.5)
  --scale is applied then triangle is drawn 
  --(white triangle)
  fill(255)
  triangle(200,100,300,300,100,300)
  --original orgin in (red) (top left)
  fill(255,0,0)
  circle(0,0,20)
  pop()

  --scaling with translating the orgin
  push()
  --orgin set to center of the canvas, this will cause the 
  --triangle to shrink aroud the center
  translate(width/2,height/2)
  scale(0.5)
  --scale is applied and then the triangle is rewritten so the 
  --points treat the center of the canvas as the 0,0 point 
  --(purple triangle)
  fill(200,50,200)
  triangle(0,-100,100,100,-100,100)
  --new origin point (green)
  fill(0,255,0)
  circle(0,0,20)
  pop()

end