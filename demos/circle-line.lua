-- Circle Line Connected and Bouncing Demo
-- Chelsea Thompto

cordX = {}
cordY = {}
moveX = {}
moveY = {}

require("L5")

function setup()
  size(600, 600)
  background(255)
  noFill()
  strokeWeight(2)

  for i = 1, 9, 1 do
    cordX[i] = random(50,350)
    cordY[i] = random(50,350)
    local diX = random()
    if diX > 0.5 then
      moveX[i] = random(1,3)
    else
      moveX[i] = random(-1,-3)
    end
    local diY = random()
    if diY > 0.5 then
      moveY[i] = random(1,3)
    else
      moveY[i] = random(-1,-3)
    end
    
    ellipse(cordX[i],cordY[i],50,50)
    if i > 1 then
      line(cordX[i],cordY[i],cordX[i-1],cordY[i-1])
    end
  end
end

function draw()
  background(255)
  for i = 1, 9, 1 do
    ellipse(cordX[i],cordY[i],50,50)
    if i > 1 then
      line(cordX[i],cordY[i],cordX[i-1],cordY[i-1])
    end

    cordX[i] = cordX[i]+moveX[i]
    if cordX[i] > width-25 then
      moveX[i] = random(-1,-3)
    elseif cordX[i] < 25 then
      moveX[i] = random(1,3)
    end

    cordY[i] = cordY[i]+moveY[i]
    if cordY[i] > height-25 then
      moveY[i] = random(-1,-3)
    elseif cordY[i] < 25 then
      moveY[i] = random(1,3)
    end
  end
end