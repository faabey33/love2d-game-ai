require "level"
require "player"
require "ai"

function love.load()
    level:generate()
    player:reset()
end

function love.update(dt)
    level:update(dt)
    player:update(dt)
end

function love.draw()
    level:draw()
    player:draw()
    ai:draw()
end