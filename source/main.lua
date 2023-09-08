import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/frameTimer"
import "player"

local pd <const> = playdate
local gfx <const> = pd.graphics

local function initializer()
    local knightImage = gfx.image.new("images/knight")
    local playerInstance = Player(200, 200, knightImage)
    playerInstance:add()
end
initializer()

function playdate.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
    gfx.drawText("Hello World", 20, 20)
end