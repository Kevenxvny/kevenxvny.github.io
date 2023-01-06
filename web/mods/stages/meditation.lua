function onCreate()

	makeLuaSprite('sky', 'meditation/epic_sky', -500, -400);
    setObjectOrder('sky', 0);
    setScrollFactor('sky', 0, 0)
    scaleObject('sky', 1.5, 1.5)

    makeLuaSprite('bushes', 'meditation/bushes', -500, 470)
    setObjectOrder('bushes', 1)
    scaleObject('bushes', 1.7, 1.7)
    setScrollFactor('bushes', 0.8, 0.95)

    makeLuaSprite('ground', 'meditation/ground', -500, 500)
    setObjectOrder('ground', 2)
    scaleObject('ground', 1.7, 1.7)

    makeLuaSprite('pillar', 'meditation/pillar', 1950, -870)
    setObjectOrder('pillar', 3)
    scaleObject('pillar', 1.7, 1.7)

    makeLuaSprite('cool', 'calm', -400, -200)
    setObjectOrder('cool', 6)
    scaleObject('cool', 2.5,2.5)
    setProperty('cool.alpha', 0)

    setObjectOrder('boyfriendGroup', 7)
    setObjectOrder('dadGroup', 8)

    makeLuaSprite('fg', 'meditation/foregroundspikes', -1000, 950)
    setObjectOrder('fg', 9)
    scaleObject('fg', 1.7, 1.7)
    setScrollFactor('fg', 0.95, 0.95)

    makeAnimatedLuaSprite('bgboppers', 'liam_bryce_bg', 1200,50);
    addAnimationByPrefix('bgboppers', 'bop', 'liambrycebg', 24, false);
    setObjectOrder('bgboppers', 5);

end

function makeBoppersDance()
    playAnim('bgboppers', 'bop', true);
end

function onBeatHit()
    if curBeat % 2 == 0 then
        makeBoppersDance();
    end
end

function onCreatePost()
    triggerEvent('Camera Follow Pos', '1050', '-1100')
end

function onUpdate()
    if curBeat == 4 then
        doTweenX('the', 'camFollow', 1050, 5, 'smoothStepInOut')
        doTweenY('theaa', 'camFollow', 650, 5, 'smoothStepInOut')
    end
    
    if curBeat == 104 then
        doTweenAlpha('cooltween', 'cool', 1, 30, 'smoothStepInOut')
        doTweenAlpha('fg says goodbye', 'fg', 0, 30, 'smoothStepInOut')
    end

    if curBeat == 352 then
        doTweenAlpha('cooltween', 'cool', 0, 1, 'smoothStepInOut')
        doTweenAlpha('fg says hi', 'fg', 1, 1, 'smoothStepInOut')
    end
end

-- BY TPOSEJANK (LITERALLY A LIFE SAVER TY)

local off = {18, 18} -- x and y movement force
local opponentNotes = true -- change this to false if you dont want to trigger when opponent notes
local bfNotes = true -- change this to false if you want to trigger when player notes
local xy = {{-off[1], 0}, {0, off[2]}, {0, -off[2]}, {off[1], 0}} -- table which has the applied movement force

function goodNoteHit(i, d, n, s)
    if bfNotes then resetCam(d) end
end
function opponentNoteHit(i, d, n, s)
    if opponentNotes then resetCam(d) end
end

function resetCam(d)
    runHaxeCode('game.moveCameraSection();')
    setProperty('camFollow.x', getProperty('camFollow.x') + xy[d+1][1])
    setProperty('camFollow.y', getProperty('camFollow.y') + xy[d+1][2])
end