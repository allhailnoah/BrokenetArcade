require "port"
require "gsts"

function love.load()
    gst = menust
    paused = false
    pausedopac = 0
    maxframe = 0.2
end

function love.update(dt)
    if not paused then
        gst.update(dt)
        if love.keyboard.isDown("escape") then
            gst.handleEscape()
        end
    end
end

function love.draw(dt)
    gst.draw()
    love.graphics.setColor(0,0,0,pausedopac)
    love.graphics.rectangle("fill", 0, 0, love.graphics:getWidth(), love.graphics:getHeight())
    love.graphics.setColor(255,255,255,255)
end

function love.mousepressed(x, y, button)
    if gst.mouse() then
        gst.handleMPr(x, y, button)
    end
end

function love.mousereleased(x, y, button)
    if gst.mouse() then
        gst.handleMRl(x, y, button)
    end
end

function love.keypressed(key, unicode)
    if gst.kbd() then
        gst.handleKPr(key)
    end
end

function love.keyreleased(key, unicode)
    if gst.kbd() then
        gst.handleKRl(key)
    end
end

function love.focus(f)
    if not f then
        pausedopac = 170
        paused = true
    else
        pausedopac = 0
        paused = false
    end
end
