import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/frameTimer"
import "knight"

local pd <const> = playdate
local gfx <const> = pd.graphics

local function initializer()
    local playerInstance = Knight(200, 200)
    playerInstance:add()
end
initializer()

function playdate.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end