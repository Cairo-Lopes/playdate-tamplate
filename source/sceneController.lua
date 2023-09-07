local pd <const> = playdate
local gfx <const> = pd.graphics

-- Remove all sprites from the screen
function clearSprites( )
    local allSprites = gfx.sprite.getAllSprites()
    for index, sprite in ipairs(allSprites) do
        sprite:remove()
    end
end

-- Set the background image
function setBackground( imageName )
    -- Display a background image
    local backgroundImage = gfx.image.new("images/" .. imageName)
    assert(backgroundImage)

    gfx.sprite.setBackgroundDrawingCallback(
        function(x ,y, width, height)
            backgroundImage:draw( 0, 0)
        end
    )
end

-- Set up the starting scene
function setStartingScene(  )
    gameState = 'start'
    clearSprites()

    PlayGameButton(200, 200)
    setBackground('startingBackground')
end

-- Sets up the starting scene
function setGameScene( )
    gameState = 'game'
    clearSprites()

    createScoreDisplay()
    Goal(200, 235)
    Player(200, 180)
    playBackgroundMusic()
    startBallSpawner()
    
    setBackground('background')
end

-- sets up the game over scene
function setGameOverScene( )
    gameState = 'game over'
    stopMusic()
    clearSprites()
    stopBallSpawner()
    PlayGameButton(200, 200)
    showFinalScore()
    setBackground('endingBackground')
end
