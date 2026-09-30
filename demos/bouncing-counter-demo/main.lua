require("L5")

-- Array of balls that bounce around the screen. We start with one.
balls = {
    {x = 100, y = 150, dirX = 1, dirY = -1}
    -- x represents the x position of the ball,
    -- y represents the y position of the ball,
    -- dirX represents the x direction the ball is moving toward
    -- dirY represents the y direction the ball is moving toward
}

speed = 1 -- set the speed that balls move at.
ballSize = 20 -- diameter, in pixels, of the balls

bounces = 0 -- how many times the ball has bounced

justClicked = false -- variable that becomes true when the mouse is clicked.

ballCost = 10 -- how much it costs to buy a ball

speedCost = 5 -- how much it costs to buy a speed upgrade

incrementSpeed = 0.5 -- how much to add to the speed each upgrade

function setup()
    size(500, 500) -- set window size
    background('#0d2b45') -- set background color. Colors in this project are from a lospec palette
    noStroke() -- turn off stroke when drawing
    fill('#ffaa5e') -- set the fill color

    -- loading and using fonts and text:
    numberFont = loadFont("assets/Not Jam Play 19.ttf") -- loads a font from a file in the project
    buttonFont = loadFont("assets/NotJamFaithless9.ttf") -- loads a font from a file in the project
    
    textAlign(CENTER, CENTER) -- set the text align to center horizontally and vertically
end

function draw()
    background('#0d2b45') -- redraw background overtop of last frame.

    -- draw score
    textFont(numberFont, 36) -- set the font that text gets drawn with
    text(bounces, width/2, height/2) -- redraw text ontop of background

    -- variables for posiitoning buttons for reuse and reducing congitive load
    ballText = "Buy Ball (" .. ballCost .. ")" 
    speedText = "Buy Speed (" .. speedCost .. ")" 

    buttonWidth = 170
    buttonHeight = 70

    buttonRadius = 5

    buttonY = height - buttonHeight - 20 -- put the bottom of the button 20 pixels from the top

    centerButton = width/2 - buttonWidth/2 -- math to place the button in the center. useful for calculations

    leftButtonX = centerButton - buttonWidth/2 - 20 -- put the right edge of the button 20 pixels to the left of the center
    rightButtonX = centerButton + buttonWidth/2 + 20 -- put the left edge of the button 20 pixels to the right of the center

    costButton(ballText, leftButtonX, buttonY, buttonWidth, buttonHeight, buttonRadius, buyBall, ballCost) -- draw a button. Custom function defined below.
    costButton(speedText, rightButtonX, buttonY, buttonWidth, buttonHeight, buttonRadius, buySpeed, speedCost) -- draw a button. Custom function defined below.

    fill('#ffaa5e') -- set the fill color for the balls
    for i = 1, #balls do
        -- Move circles by adding to their position values (the direction * the speed resulting in velocity in this case)
        balls[i].x = balls[i].x + (balls[i].dirX * speed)
        balls[i].y = balls[i].y + (balls[i].dirY * speed)

        -- if the x position is off the screen, then...
        if balls[i].x < 0 or balls[i].x > width then
            bounceX(i)
        end
        -- if the y position is off the screen, then...
        if balls[i].y < 0 or balls[i].y > height then
            bounceY(i)
        end

        -- Draw balls at respective positions using ballSize
        circle(balls[i].x, balls[i].y, ballSize)
    end

    justClicked = false -- Reset the justClicked function to false at the end since the mouse is no longer just clicked!
end

-- bounce functions. They reverse the direction of X or Y respectively by multiplying the dir by -1
function bounceX(circle_id)
    balls[circle_id].dirX = balls[circle_id].dirX * -1
    bounce(circle_id)
end
function bounceY(circle_id)
    balls[circle_id].dirY = balls[circle_id].dirY * -1
    bounce(circle_id)
end

-- To reduce the amount of re-writing code, I made a function to reuse whenever a bounce happens. As of now, it just increments the bounces, but if I wanted to do more every bounce, I wouldn't have to rewrite everything
function bounce(circle_id)
    bounces = bounces + 1 -- add one to the bounces variable
end

function draw_button(bText, x, y, bWidth, bHeight, radius, func, enabled)
    -- boolean that represents if mouse is hovering over this specific button
    hovering = mouseX > x and mouseX < x + bWidth and mouseY > y and mouseY < y + bHeight


    -- if the mouse is hovering over this button, change the fill color of the rectangle
    if not enabled then
        fill("#203c56")
    elseif hovering then
        fill("#8d697a")
    else
        fill("#544e68")
    end
    rect(x, y, bWidth, bHeight, radius)

    -- if the mouse is hovering over this button, change the fill color of the text
    if not enabled then
        fill("#544e68")
    elseif hovering then
        fill("#544e68")
    else
        fill("#ffd4a3")
    end
    textFont(buttonFont, 16) -- set the font that text gets drawn with
    text(bText, x + bWidth/2, y + bHeight/2) -- redraw text ontop of background

    -- if the mouse is hovering over this button, the mouse was just clicked, and it is enabled, run func
    if hovering and justClicked and enabled then
        func()
    end
end

 -- built in function that is called once whenever the mouse is pressed and then released
function mouseClicked()
    justClicked = true -- set justClicked to true, because it was just clicked!
end

-- A function to spawn a new ball! It's reusable!
function spawnball()
    -- set up a new ball to add to the list. Set each x and y value to a random value between 1 and the edge of the screen.
    -- set the direction to a random number, either -1 or 1 by putting a list inside the random function so it chooses a value from that list.
    newBall = {x = random(1, width-1), y = random(1, height-1), dirX = random({-1, 1}), dirY = random({-1, 1})}
    table.insert(balls, newBall) -- insert the ball into the table
end

-- works by drawing a button using all the same parameters, but adds one more: cost to determine if the button can be clicked or not
function costButton(bText, x, y, bWidth, bHeight, radius, func, cost)
    buyable = (bounces > cost-1) -- the button is buyable if the player has more bounces than it costs.

    -- draw a button, making the endabled parameter only work if buyable
    draw_button(bText, x, y, bWidth, bHeight, radius, func, buyable)
end

-- buys a ball by subtracting the bounces by the cost.
function buyBall()
    bounces = bounces - ballCost
    spawnball()
end

-- buys a speed upgrade by subtracting the bounces by the cost.
function buySpeed()
    bounces = bounces - speedCost
    speed = speed + incrementSpeed
end