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

function setup()
    size(500, 500) -- set window size
    background('#0d2b45') -- set background color. Colors in this project are from a lospec palette
    noStroke() -- turn off stroke when drawing
    fill('#ffaa5e') -- set the fill color

    -- loading and using fonts and text:
    font = loadFont("assets/Not Jam Play 19.ttf") -- loads a font from a file in the project
    textFont(font, 36) -- set the font that text gets drawn with
    textAlign(CENTER, CENTER) -- set the text align to center horizontally and vertically
end

function draw()
    background('#0d2b45') -- redraw background overtop of last frame.
    text(bounces, width/2, height/2) -- redraw text ontop of background

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

-- To reduce the amount of re-writing code, I made a function to reuse whenever a bounce happens
function bounce(circle_id)
    bounces = bounces + 1 -- add one to the bounces variable
end