local r1, r2

function love.load()
    --Create 2 rectangles
    r1 = {
        x = 10,
        y = 100,
        width = 100,
        height = 100
    }

    r2 = {
        x = 250,
        y = 120,
        width = 150,
        height = 120
    }
end

function love.update(dt)
    --Make one of rectangle move
    r1.x = r1.x + 100 * dt
end

function love.draw()
    --We create a local variable called mode
    local mode
    if checkCollision(r1, r2) then
        --If there is collision, draw the rectangles filled
        mode = "fill"
    else
        --else, draw the rectangles as a line
        mode = "line"
    end

    --Use the variable as first argument
    love.graphics.rectangle(mode, r1.x, r1.y, r1.width, r1.height)
    love.graphics.rectangle(mode, r2.x, r2.y, r2.width, r2.height)
end

function checkCollision(a, b)
    --With locals it's common usage to use underscores instead of camelCasing
    local a_left = a.x
    local a_right = a.x + a.width
    local a_top = a.y
    local a_bottom = a.y + a.height

    local b_left = b.x
    local b_right = b.x + b.width
    local b_top = b.y
    local b_bottom = b.y + b.height

    --Directly return this boolean value without using if-statement
    return a_right > b_left
        and a_left < b_right
        and a_bottom > b_top
        and a_top < b_bottom
end
