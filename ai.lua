ai = {}

function ai:draw()
    love.graphics.rectangle("line", love.graphics.getWidth()/3+20, level.y + 20, love.graphics.getWidth()/3*2-40, love.graphics.getHeight()-level.y-40)
end