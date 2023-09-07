import "CoreLibs/graphics"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"


import "globals"
import "goal"
import "player"
import "ballSpawner"
import "playGameButton"
import "scoreDisplay"
import "powerUpSpawner"
import "sceneController"
import "soundController"


local pd <const> = playdate
local gfx <const> = pd.graphics

setStartingScene()

function resetGame()
    loadHighscore()
    resetScore()
    clearBalls()
    stopBallSpawner()
    startBallSpawner()
    startPowerUpSpawner()
    
end

function pd.update()
   -- update the sprites and the timer
    gfx.sprite.update()
    pd.timer.updateTimers()
end