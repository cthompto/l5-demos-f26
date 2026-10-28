-- Fake Audio Visualizer Demo
-- Chelsea Thompto
-- Partially complete

rectW = 80
rectH = 30
colH1 = 6
colH2 = 4
colH3 = 5
colH4 = 5
colH5 = 3
colH6 = 2
col1AP = 200
col1AB = 100

upDown = {-1,1}

require("L5")

function setup()
  size(600, 400)
  windowTitle("Riso Demo 1")
  describe('Color Chart')
 background(200)
end

function draw()
 background(0,200,150)

vertCol(35,400, colH1, col1AP, col1AB)
vertCol(125, 400, colH2, col1AP, col1AB)
vertCol(215, 400, colH3, col1AP, col1AB)
vertCol(305, 400, colH4, col1AP, col1AB)
vertCol(395, 400, colH5, col1AP, col1AB)
vertCol(485, 400, colH6, col1AP, col1AB)
 
if frameCount%30 == 0 then
  if colH1 > 6 then
    colH1 = colH1 - 1
  elseif colH1 == 1 then
    colH1 = colH1 + 1
  else 
    colH1 = colH1 + random(upDown)
  end

  if colH2 > 6 then
    colH2 = colH2 - 1
  elseif colH2 == 1 then
    colH2 = colH2 + 1
  else 
    colH2 = colH2 + random(upDown)
  end

  if colH3 > 6 then
    colH3 = colH3 - 1
  elseif colH3 == 1 then
    colH3 = colH3 + 1
  else 
    colH3 = colH3 + random(upDown)
  end

  if colH4 > 6 then
    colH4 = colH4 - 1
  elseif colH4 == 1 then
    colH4 = colH4 + 1
  else 
    colH4 = colH4 + random(upDown)
  end

  if colH5 > 6 then
    colH5 = colH5 - 1
  elseif colH5 == 1 then
    colH5 = colH5 + 1
  else 
    colH5 = colH5 + random(upDown)
  end

  if colH6 > 6 then
    colH6 = colH6 - 1
  elseif colH6 == 1 then
    colH6 = colH6 + 1
  else 
    colH6 = colH6 + random(upDown)
  end
  col1AP = random(205)
  col1AB = random(155)
end

end

function vertCol(x,y,h,a1,a2)
  for i = 1, h, 1 do
    fill(255)
    rect(x,y-i*50, rectW, rectH)
    fill(255,72, 176, a1)
    rect(x,y-i*50, rectW, rectH)
    fill(0,120, 191, a2)
    rect(x,y-i*50, rectW, rectH)
  end
end


