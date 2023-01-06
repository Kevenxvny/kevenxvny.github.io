function onCreate()
	makeLuaSprite('bg', 'strandedbg', 0, -760);
    scaleObject('bg', 2.5, 2.5);
    setObjectOrder('bg', 1);

    makeLuaSprite('vignette', 'blackvignette', 0, 0)
    setObjectCamera('vignette', 'camOther')
    setProperty('vignette.alpha', 0)
    setObjectOrder('vignette', 100)

    setObjectOrder('boyfriendGroup', 4)
    setObjectOrder('dadGroup', 5)

    makeLuaSprite('black', 'black', 0, -400)
    setProperty('black.alpha', 0)
    scaleObject('black', 1000000, 10000000)
    setObjectOrder('black', 2)

    makeAnimatedLuaSprite('bgboppers', 'trayscenty', 1700,-160);
    addAnimationByPrefix('bgboppers', 'bop', 'trayameliabg', 24, false);
    setObjectOrder('bgboppers', 3);

    makeLuaSprite('dialoguescene1', 'dialoguebgs/stranded1', 0, 0)
    setObjectOrder('dialoguescene1', 15)
    setObjectCamera('dialoguescene1', 'camHUD')
    setProperty('dialoguescene1.alpha', 0)

    makeLuaSprite('dialoguescene2', 'dialoguebgs/stranded2', 0, 0)
    setObjectOrder('dialoguescene2', 17)
    setObjectCamera('dialoguescene2', 'camHUD')
    setProperty('dialoguescene2.alpha', 0)

    makeLuaSprite('lol', 'dialoguebgs/strandedfunny', 0, 0)
    setObjectOrder('lol', 16)
    setObjectCamera('lol', 'camHUD')
    setProperty('lol.alpha', 0)

    makeLuaSprite('dialoguescene3', 'dialoguebgs/stranded3', 0, 0)
    setObjectOrder('dialoguescene3', 18)
    setObjectCamera('dialoguescene3', 'camHUD')
    setProperty('dialoguescene3.alpha', 0)

end

function makeBoppersDance()
    playAnim('bgboppers', 'bop', true);
end

function onBeatHit()
    if curBeat % 2 == 0 then
        makeBoppersDance();
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

function onUpdate()
    if curBeat == 96 then
        doTweenAlpha('blackfade','black', 0.6, 4, 'smoothStepInOut')
        doTweenAlpha('vignettefade','vignette', 0.8, 8, 'smoothStepInOut')
        doTweenZoom('camtween', 'camGame', 1, 9, 'smoothStepInOut')
    end
    if curBeat == 116 then
        setProperty('defaultCamZoom', 1)
    end
    if curBeat == 127 then
        doTweenAlpha('blackfade', 'black', 0, 1, 'smoothStepInOut')
        doTweenAlpha('vignettefade', 'vignette', 0, 1, 'smoothStepInOut')
        doTweenZoom('camtween', 'camGame', 0.8, 1, 'smoothStepInOut')
    end
    if curBeat == 129 then
        setProperty('defaultCamZoom', 0.8)
    end
end