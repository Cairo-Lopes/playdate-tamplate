import "projectile"

local pd <const> = playdate
local gfx <const> = pd.graphics
local projectileInstance
local reload_timer = 500
local shoot_state = true

class('Player').extends(gfx.sprite)

function Player:init( x, y, image )
    self:moveTo(x, y)
    self:setImage(image)
    self.moveSpeed = 1
    self.projectileSpeed = 1
end

function Player:_createShoot(x, y)
    projectileInstance = Projectile(x, y - 10, self.projectileSpeed)
    projectileInstance:add()
end
function Player:shoot()
    if shoot_state then
        self:_createShoot(self.x, self.y)
        self:_reloading()
    end
end

function Player:_reloading()
    shoot_state = false
    local function activate_shoot()
        shoot_state = true
    end
    pd.timer.performAfterDelay(reload_timer, activate_shoot)
end
function Player:ability()
    local function timerCallback()
        self:_createShoot(self.x, self.y)
    end

    if shoot_state then
        pd.timer.performAfterDelay(50, timerCallback)
        pd.timer.performAfterDelay(400, timerCallback)
        reload_timer = 1500
        self:_reloading()
        reload_timer = 500
    end
end 
local timer = pd.frameTimer.new(2000, 0, 2000)
timer:start()

function Player:update()
    Player.super.update(self)
    pd.timer.updateTimers()
    if pd.buttonJustReleased(pd.kButtonA) then
        self:shoot()
    end
    if pd.buttonJustPressed(pd.kButtonB) then
        self:ability()
    end
    if pd.buttonIsPressed(pd.kButtonLeft) then
        self:moveBy(-self.moveSpeed, 0)
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        self:moveBy(self.moveSpeed, 0)
    end
end