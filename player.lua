player = {
    x = 40,
    w = 20,
    h = 20,
    y = 0,
    aliveFor = 0,
    jump = false,
    jumpSuccess = 0,
    jumpCount = 0,
    state = "dead"
}

function player:reset()
    self.jump = false
    self.state = "dead"
    self.jumpCount = 0
    self.jumpSuccess = 0
    self.aliveFor = 0
    self.x = 40
    self.y = level.y-self.h
end

function player:update(dt)
    if level.state == "running" then
        self.aliveFor = self.aliveFor + 1 * dt
        self.state = "alive"
        for i = 1, #level.blocks do
            local b = level.blocks[i]
            if checkCollision(self.x, self.y, self.w, self.h, b.x, b.y, b.w, b.h) then
                level.state = "stopped"
                player:reset()
                level:reset()
                break; 
            end
        end
    else
        self.state = "stopped" 
    end
end

function player:draw()
    love.graphics.setColor(0,255,0,255)
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
    love.graphics.setColor(255,255,255,255)
    love.graphics.rectangle("line", 20, level.y+20, love.graphics.getWidth()/3-10, love.graphics.getHeight()-level.y - 40)
    love.graphics.printf( "Player \n\nState - "..self.state.."\nJumps - "..self.jumpCount.." / "..self.jumpSuccess.."\nTime - "..self.aliveFor, 30, level.y+30, love.graphics.getWidth()/3-20, "left" )
end

function checkCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end