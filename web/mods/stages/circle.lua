function onCreate()
    precacheImage('illusethisfortheirattention/nothing')

	makeLuaSprite('nothing', 'illusethisfortheirattention/nothing', -13713, -5000);
    scaleObject('nothing', 1370, 1370);
    setObjectOrder('nothing', 1);


    makeAnimatedLuaSprite('bgguys', 'circle_background_idiots', 1550, 0);
    addAnimationByPrefix('bgguys', 'Symbol 260000', 'Symbol 260000', 24, true);
    setProperty('bgguys.antialiasing', true);
    setScrollFactor('bgguys', 0.9, 0.9)
    setObjectOrder('bgguys', 2);

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