function onCreate()
	makeLuaSprite('bg', 'cohostaa', 300, 380);
    scaleObject('bg', 1.6, 1.5);
	setScrollFactor('bg', 1, 1);
	setProperty('bg.antialiasing', true);
	setObjectOrder('bg', 1);

	makeLuaSprite('bg1', 'cohostbgfront', 300, 380);
    scaleObject('bg1', 1.6, 1.5);
	setScrollFactor('bg1', 1, 1);
	setProperty('bg1.antialiasing', true);
	setObjectOrder('bg1', 3);

	makeLuaSprite('bg2', 'cohostforeground', 300, 1080);
    scaleObject('bg2', 1.6, 1.6);
	setScrollFactor('bg2', 0.9, 0.9);
	setProperty('bg2.antialiasing', true);
	setObjectOrder('bg2', 8);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 2);
	setScrollFactor('dadGroup', 0.8, 0.8)

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 7);

end

function onMoveCamera(focus)
    if focus == 'dad' then
        setProperty('defaultCamZoom', 0.75)
    elseif focus == 'boyfriend' then 
        setProperty('defaultCamZoom', 0.9)
    end
end

function onUpdate(elapsed)
	for i=0,3 do
	   noteTweenAlpha('dieaaa'..i, i, 0.5, 0.0000000000001, 'linear')
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