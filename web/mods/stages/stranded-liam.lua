function onCreate()
	makeLuaSprite('bg', 'strandedbg', 0, -760);
    scaleObject('bg', 2.5, 2.5);
    setObjectOrder('bg', 1);

    makeLuaSprite('vignette', 'blackvignette', 0, 0)
    setObjectCamera('vignette', 'camOther')
    setProperty('vignette.alpha', 0)
    setObjectOrder('vignette', 100)

    setObjectOrder('boyfriendGroup', 5)
    setObjectOrder('dadGroup', 4)

    makeLuaSprite('black', 'black', 0, -400)
    setProperty('black.alpha', 0)
    scaleObject('black', 1000000, 10000000)
    setObjectOrder('black', 2)

    makeAnimatedLuaSprite('bgboppers', 'trayscenty', 1700,-160);
    addAnimationByPrefix('bgboppers', 'bop', 'trayameliabg', 24, false);
    setObjectOrder('bgboppers', 3);

    makeLuaSprite('note', 'youplayas', 1000, -200)
    setObjectOrder('note', 8)

end

function onSongStart()
    runTimer('waiting wtf', 2)
end

function onTimerCompleted(tag)
    if tag == 'waiting wtf' then
        doTweenY('notemove', 'note', 500, 2, 'smoothStepInOut')
        doTweenAngle('noteturn', 'note', 360, 2, 'smoothStepInOut')

        runTimer('gone', 4)
    end
    if tag == 'gone' then
        removeLuaSprite('note')
    end
end

function onCreatePost()
    noteTweenX('defaultPlayerStrumY0', 4, ((screenWidth / 3) - 330) - 0, 0.5, 'smoothStepInOut')
    noteTweenX('defaultPlayerStrumY1', 5, ((screenWidth / 3) - 220) - 0, 0.5, 'smoothStepInOut')
    noteTweenX('defaultPlayerStrumY2', 6, ((screenWidth / 3) - 110) - 0, 0.5, 'smoothStepInOut')
    noteTweenX('defaultPlayerStrumY3', 7, ((screenWidth / 3) + 0) - 0, 0.5, 'smoothStepInOut')
    noteTweenX('defaultFPlayerStrumY0', 0, ((screenWidth / 3 * 2) - 0) - 100, 0.5, 'smoothStepInOut')
    noteTweenX('defaultFPlayerStrumY1', 1, ((screenWidth / 3 * 2) + 110) - 100, 0.5, 'smoothStepInOut')
    noteTweenX('defaultFPlayerStrumY2', 2, ((screenWidth / 3 * 2) + 220) - 100, 0.5, 'smoothStepInOut')
    noteTweenX('defaultFPlayerStrumY3', 3, ((screenWidth / 3 * 2) + 330) - 100, 0.5, 'smoothStepInOut')
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