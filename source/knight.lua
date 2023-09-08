import "Player"

local pd <const> = playdate
local gfx <const> = pd.graphics

class("Knight").extends(Player)

function Knight:init(x ,y)
    local knightImage = gfx.image.new("images/knight")
    Knight.super.init(self, x, y, knightImage)
    self.moveSpeed = 1
    self.projectileSpeed = 3
end

function Knight:ability()
    Knight.super.ability(self)
    local function timerCallback()
        print('-- knight --')
        self:_createShoot(self.x, self.y)
    end
    pd.timer.performAfterDelay(200, timerCallback)
    pd.timer.performAfterDelay(300, timerCallback)

end