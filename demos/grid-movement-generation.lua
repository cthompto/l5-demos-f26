require("L5")

gridX = 0 -- how wide each tile is
gridY = 0 -- how tall each tile is 

gridWidth = 0 -- how many tiles in the grid in the X direction
gridHeight = 0 -- how many tiles in the grid in the Y direction

grid = {} -- initalize an empty grid

gridColor = '#230000' -- color to use when drawing the empty grid spaces
wallColor = '#712f30' -- color to use when drawing the walls
playerColor = '#ffe2c6' -- color to use when drawing the player

playerCoords = {x = 2, y = 2} -- the current coordinates of the player
wallPlacePercentage = 0.1 -- 10 % chance to place a wall
clearWallPercentage = 0.2 -- 20% chance to clear all walls

function setup()
    size(1600, 900) -- set window size
    initGrid(160, 90) -- make a grid with a width of 6 tiles and height of 5 tiles 
    placeEdgeWalls() -- place walls around the edge
    placeRandomWalls() -- place walls randomly around the map
    noStroke() -- remove stroke
    grid[playerCoords.x][playerCoords.y] = "player" -- set the gridspace of the player's coordinates to be filled by the player
end

-- set the gridX and gridY variables based on the screen width & height and the number of grid squares desired.
function setGridSize(xNum, yNum)
    gridX = width / xNum -- set gridX (the width of each tile) to the width of the screen divided by the number of x tiles
    gridY = height / yNum -- set gridY (the height of each tile) to the height of the screen divided by the number of y tiles

    gridHeight = yNum -- set gridHeight to the number of y tiles specified
    gridWidth = xNum -- set gridWidth to the number of x tiles specified
end

-- create an empty grid using a nested for loop.
function initGrid(xNum, yNum)
    setGridSize(xNum, yNum) -- above defined function
    -- nested for loop to create a grid out of an array of arrays
    for x = 1, gridWidth do
        grid[x] = {}
        for y = 1, gridHeight do
            grid[x][y] = "" -- set the grid tile to empty
        end
    end
end

function draw()
    -- draw the base grid
    for x = 1, gridWidth, 1 do
        for y = 1, gridHeight, 1 do
            if (grid[x][y] == "") then -- if the gridspace is empty, draw the empty gridspace via the function defined below
                fill(gridColor) -- set the fill color
            elseif (grid[x][y] == "wall") then
                fill(wallColor)
            elseif (grid[x][y] == "player") then
                fill(playerColor)
            end
            rect((x-1) * gridX, (y-1) * gridY,gridX,gridY) -- draw the current tile at the specified X and Y
        end
    end
end

-- Built-in L5 function for whenever a keyboard key is pressed.
function keyPressed()
    -- WASD Movement
    if string.match(key, "d") then -- if the key pressed was the d key...
        if grid[playerCoords.x+1][playerCoords.y] ~= "wall"  then -- if there isn't a wall in the way, then...
            grid[playerCoords.x][playerCoords.y] = "" -- remove player from the previous grid space
            playerCoords.x = playerCoords.x + 1 -- set the player's new x position
            grid[playerCoords.x][playerCoords.y] = "player" -- set the cooresponding gridspace to the player
        end
    elseif string.match(key, "a") then  -- if the key pressed was the a key...
        if grid[playerCoords.x-1][playerCoords.y] ~= "wall"  then -- if there isn't a wall in the way, then...
            grid[playerCoords.x][playerCoords.y] = "" -- remove player from the previous grid space
            playerCoords.x = playerCoords.x - 1 -- set the player's new x position
            grid[playerCoords.x][playerCoords.y] = "player" -- set the cooresponding gridspace to the player
        end
    elseif string.match(key, "s") then  -- if the key pressed was the s key...
        if grid[playerCoords.x][playerCoords.y+1] ~= "wall"  then -- if there isn't a wall in the way, then...
            grid[playerCoords.x][playerCoords.y] = "" -- remove player from the previous grid space
            playerCoords.y = playerCoords.y + 1 -- set the player's new x position
            grid[playerCoords.x][playerCoords.y] = "player" -- set the cooresponding gridspace to the player
        end
    elseif string.match(key, "w") then  -- if the key pressed was the w key...
        if grid[playerCoords.x][playerCoords.y-1] ~= "wall"  then -- if there isn't a wall in the way, then...
            grid[playerCoords.x][playerCoords.y] = "" -- remove player from the previous grid space
            playerCoords.y = playerCoords.y - 1 -- set the player's new x position
            grid[playerCoords.x][playerCoords.y] = "player" -- set the cooresponding gridspace to the player
        end
    end

    -- do  when any of the movement keys are pressed
    if string.match(key, "d") or string.match(key, "a") or string.match(key, "s") or string.match(key, "w") then
      if random(0, 1) < clearWallPercentage then
        removeWalls()
      end
      placeEdgeWalls()
      placeRandomWalls()
    end
end

function placeEdgeWalls()
    for x = 1, gridWidth, 1 do
        for y = 1, gridHeight, 1 do
            -- set the grid tile to be a wall if it is on one of the edges of the screen
            if (x == 1) or (y == 1) or (x == gridWidth) or (y == gridHeight) then
                grid[x][y] = "wall" -- set the grid tile to wall
            end
        end
    end
end

function placeRandomWalls()
    for x = 1, gridWidth, 1 do
        for y = 1, gridHeight, 1 do
            -- have a chance to place a wall if the grid spot doesn't contain a player
            if grid[x][y] ~= "player" and random(0, 1) < wallPlacePercentage then
                grid[x][y] = "wall" -- set the grid tile to wall
            end
        end
    end
end

function removeWalls()
  for x = 1, gridWidth, 1 do
        for y = 1, gridHeight, 1 do
            if grid[x][y] ~= "player"then
                grid[x][y] = "" -- set the grid tile to empty
            end
        end
    end
end
