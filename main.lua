local player, enemy

function love.load()
    Object = require "classic"
    require "player"
    require "enemy"
    require "bullet"

    player = Player()
    enemy = Enemy()
    ListOfBullets = {}
end

function love.update(dt)
    player:update(dt)
    enemy:update(dt)

    for i, v in ipairs(ListOfBullets) do
        v:update(dt)
        v:checkCollision(enemy)

        --If the bullet has the property dead and it's true then..
        if v.dead then
            --Remove it from the list
            table.remove(ListOfBullets, i)
        end
    end
end

function love.draw()
    player:draw()
    enemy:draw()

    for i, v in ipairs(ListOfBullets) do
        v:draw()
    end
end

function love.keypressed(key)
    player:keyPressed(key)
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
