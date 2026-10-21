-- Animating Shapes to Random Target
-- Chelsea Thompto

-- Array for holding shapes.
myShapes = {}

-- Riso color array to choose from later.
risoColors = {"pink", "blue", "yellow"}

require("L5")

function setup()
  size(400, 400)
  windowTitle("Animating to Random Target Demo")
  describe('Black text on light grey.')
  background(0)
  noStroke()

  -- Generate shapes and add them to an array.
  for i = 1, 10 do
    -- Create a new shape with the following values. w, h, x, and y for current
    -- size and position,  wt, ht, xt, and yt for the target to move to for each.
    newShape = {
      color = random(risoColors),
      w = random(50,150),
      h = random(30,60),
      x = random(100,300),
      y = random(100,300),
      wt = random(50,150),
      ht = random(30,60),
      xt = random(100,300),
      yt = random(100,300)
    }
    -- Add created entry to our table
    table.insert(myShapes, newShape)
  end
end

function draw()
  -- Alpha here for a motion blur effect.
  background(0,20)
  -- For loop the runs through all the items in the shapes array.
  for i = 1, #myShapes do

    -- Choose fill color based on which color was chosen (added alpha here for fun).
    if myShapes[i].color == "blue" then
      fill(0, 120, 191,200)
    elseif myShapes[i].color == "pink" then
      fill(255, 72, 176,200)
    elseif myShapes[i].color == "yellow" then
      fill(255, 232, 0,200)
    end

    -- Draw the shape at the point and dimensions generated.
    -- Uses the table and arritubes we defined.
    ellipse(myShapes[i].x, myShapes[i].y,myShapes[i].w, myShapes[i].h)

    -- Check the x position against the x target, if they are with 1(+/-) pick a 
    -- target, otherwise move towards the target. This creates the bouncing
    -- movement.
    if myShapes[i].x < myShapes[i].xt+1 and myShapes[i].x > myShapes[i].xt-1 then
      myShapes[i].xt = random(50,350)
    elseif myShapes[i].x < myShapes[i].xt then
      myShapes[i].x = myShapes[i].x + 0.5
    elseif myShapes[i].x > myShapes[i].xt then
      myShapes[i].x = myShapes[i].x - 0.5
    end

    -- Do the same for the y value.
    if myShapes[i].y < myShapes[i].yt+1 and myShapes[i].y > myShapes[i].yt-1 then
      myShapes[i].yt = random(50,350)
    elseif myShapes[i].y < myShapes[i].yt then
      myShapes[i].y = myShapes[i].y + 0.5
    elseif myShapes[i].y > myShapes[i].yt then
      myShapes[i].y = myShapes[i].y - 0.5
    end

    -- Do the same for the w value.
    if myShapes[i].w < myShapes[i].wt+1 and myShapes[i].w > myShapes[i].wt-1 then
      myShapes[i].wt = random(50,150)
    elseif myShapes[i].w < myShapes[i].wt then
      myShapes[i].w = myShapes[i].w + 0.3
    elseif myShapes[i].w > myShapes[i].wt then
      myShapes[i].w = myShapes[i].w - 0.3
    end

    -- Do the same for the h value.
    if myShapes[i].h < myShapes[i].ht+1 and myShapes[i].h > myShapes[i].ht-1 then
      myShapes[i].ht = random(30,60)
    elseif myShapes[i].h < myShapes[i].ht then
      myShapes[i].h = myShapes[i].h + 0.1
    elseif myShapes[i].h > myShapes[i].ht then
      myShapes[i].h = myShapes[i].h - 0.1
    end
  end
end