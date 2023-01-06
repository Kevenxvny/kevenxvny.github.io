function onCreate()
    precacheImage('glitchdehumanized')
    addCharacterToList('dehumanizedliam', 'boyfriend')
    addCharacterToList('dehumanizedliam2', 'boyfriend')
    addCharacterToList('dehumanizedbryce', 'dad')
    addCharacterToList('dehumanizedbryce2', 'dad')

    setObjectOrder('boyfriendGroup', 5)
    setObjectOrder('dadGroup', 6)

	makeLuaSprite('bg1', 'dehumanizedbg', 950, -420);
    scaleObject('bg1', 1.7, 1.6);
    setObjectOrder('bg1', 2);

    makeLuaSprite('bgback', 'the_waiting_roomenough', 1100, -420);
    scaleObject('bgback', 1.2, 1.2);
    setObjectOrder('bgback', 3);
    setProperty('bgback.alpha', 0.00000000000000000000000000000000000000000000000000000001)

    makeAnimatedLuaSprite('bg2', 'glitchdehumanized', 800, -420);
    addAnimationByPrefix('bg2', 'glitched', 'glitch', 24, true);
    setProperty('bg2.antialiasing', true);
    scaleObject('bg2', 1.7, 1.6)
    setObjectOrder('bg2', 4);
    setProperty('bg2.alpha', 0.00000000000000000000000000000000000000000000000000000001)

end

function onEvent(n,v1,v2)
    if n == 'Stage Switch' and string.lower(v1) == '2nd' then
        setProperty('bgback.alpha', 1)
        setProperty('bg2.alpha', 1)
        setProperty('b1.alpha', 0)
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