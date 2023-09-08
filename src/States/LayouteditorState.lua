sceneeditorstate = {}

local squares = {}

function sceneeditorstate:enter()
    -- o metodo dos quadrados e dos retangulos podem ser facilmente modificados por metodos mais avançados, como um de um botão que cria um novo objeto. Porem estou usando isso somente para fazer o teste
    rect = {
        x = 100,
        y = 100,
        w = 50,
        h = 50
    }
    isDragging = false
end

function sceneeditorstate:draw()
    love.graphics.rectangle("line", rect.x, rect.y, rect.w, rect.h)
    for _, square in ipairs(squares) do
        love.graphics.rectangle("fill", square.x, square.y, square.w, square.h)
    end
end

function sceneeditorstate:update(elapsed)
    for _, square in ipairs(squares) do
        if square.isDragging then
            square.x = love.mouse.getX() - square.offsetX
            square.y = love.mouse.getY() - square.offsetY
        end
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then
        if x >= rect.x and x <= rect.x + rect.w and y >= rect.y and y <= rect.y + rect.h then
            local square = {x = x - rect.w / 2, y = y - rect.h / 2, w = rect.w, h = rect.h}
            square.offsetX = x - square.x
            square.offsetY = y - square.y
            square.isDragging = true
            table.insert(squares, square)
        else
            -- esse codigo eu tive que ir buscar em uns lugares da mídia, eu fiquei bem confuso na hora de o fazer
            for _, square in ipairs(squares) do
                local distX = x - (square.x + square.w / 2)
                local distY = y - (square.y + square.h / 2)
                if math.abs(distX) <= square.w / 2 and math.abs(distY) <= square.h / 2 then
                    square.offsetX = x - square.x
                    square.offsetY = y - square.y
                    square.isDragging = true
                    break
                end
            end
        end
    end
end

function love.mousereleased(x, y, button)
    if button == 1 then
        for _, square in ipairs(squares) do
            if square.isDragging then
                square.isDragging = false
                square.x = x - square.offsetX
                square.y = y - square.offsetY
            end
        end
    end
end

return sceneeditorstate