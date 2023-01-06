function onCreate()
    makeLuaSprite('wow', 'whiteboard', -500, -200);
    scaleObject('wow', 2, 2);
	setScrollFactor('wow', 1, 1);
	setProperty('wow.antialiasing', true);
	setObjectOrder('wow', 0);

    makeLuaSprite('dieded', 'dead', -200, 550);
    setScrollFactor('dieded', 1.1, 1.1);
    setProperty('dieded.antialiasing', true);
    setObjectOrder('dieded', 3);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 1);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 2);

    setProperty('healthGain', 0)
    setProperty('healthLoss', 0)

    --[[makeLuaText('nicetry', 'no death for you L!!!!', 1250, 0, 250)
    setTextAlignment('nicetry', 'Center')
    addLuaText('nicetry')
    setProperty('nicetry.alpha', 0)
    setTextSize('nicetry', 137)
    setTextString('nicetry', 'no death for you L!!!!')
    setTextColor('nicetry', 'FFFFFF')
    setObjectOrder('nicetry', 102)
    setObjectCamera('nicetry', 'camOther')]]
end

--[[ no death L!!! actually nvm lol
function onGameOver()
    setHealth(1)
    doTweenAlpha('wow', 'nicetry', 1, 0.5, 'expoOut')
    runTimer("this is the first time i've ever used a timer lol", 1)
    return Function_Stop
end

function onTimerCompleted(tag)
    if tag == "this is the first time i've ever used a timer lol" then
        doTweenAlpha('wowbye', 'nicetry', 0, 1, 'smoothStepOut')
    end
end]]

function onUpdate()
    setProperty('healthBar.alpha', 0)
    setProperty('healthBarBG.alpha', 0)

    if curBeat == 1 then
        for i = 0, 3 do
            noteTweenAlpha('kys :3'..i, i, 0.6, 0.1, 'linear')
        end
    end
    if curBeat == 7 then
        for i = 0, 3 do
            noteTweenAlpha('kys :3'..i, i, 0, 0.2, 'linear')
        end
    end
end

function onMoveCamera(focus)
    if focus == 'dad' then
        setProperty('defaultCamZoom', 0.7)
    elseif focus == 'boyfriend' then
        setProperty('defaultCamZoom', 0.7)
    end
end

-- BY TPOSEJANK (LITERALLY A LIFE SAVER TY)

local off = {15, 15} -- x and y movement force
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

