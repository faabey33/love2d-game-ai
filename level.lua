level = {
    y = 330,
    grid = 300,
    blocks = {
        h = 20,
        w = 20
    },
    speed = 200,
    state = "stopped"
}

function level:reset()
    for i = #self.blocks, 1, -1 do
        table.remove(level.blocks, i) 
    end
    level:generate()
end

function level:generate()
    local b = level.blocks
    for a = 1, math.floor(love.graphics.getWidth()/level.grid) do
        table.insert(b, {x = a * self.grid, y = self.y - b.h, w = b.w, h = b.h }) 
    end
end

function level:update(dt)
    if level.state == "running" then
        local b = level.blocks
        for i = 1, #b do
            b[i].x = b[i].x - level.speed * dt 
            if b[i].x < 0 then
                if i < #b then
                    b[i].x = b[i+1].x + level.grid
                else
                    b[i].x = b[1].x + level.grid
                end
            end
        end
    end
end


function drawGrid()
    love.graphics.line(0, level.y, love.graphics.getWidth(), level.y+2)
    --[[local b = level.blocks
    love.graphics.setColor(255,255,255,100)
    love.graphics.line(0, level.y-level.grid/2, love.graphics.getWidth(), level.y-level.grid/2)
    for i = 1, #b do
        love.graphics.line(b[i].x, 0, b[i].x, level.y) 
        love.graphics.line(b[i].x+level.grid/2, 0, b[i].x+level.grid/2, level.y) 
    end
    love.graphics.setColor(255,255,255,255)]]--
end

function drawBoxes()
    local b = level.blocks
    for a = 1, #b do
        love.graphics.rectangle("line", b[a].x, b[a].y, b[a].w, b[a].h)
    end
end


function level:draw()
    drawGrid()
    drawBoxes()
end

function love.keypressed(k)
    if k == "space" then
        if level.state == "stopped" then
            level.state = "running" 
        else
            level.state = "stopped" 
        end
    end
end