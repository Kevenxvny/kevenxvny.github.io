function onCreate()
	makeLuaSprite('scenty', 'scenty', -1100, -900);
    scaleObject('scenty', 2, 2);
	setScrollFactor('scenty', 1, 1);
	setProperty('scenty.antialiasing', true);
	setObjectOrder('scenty', 0);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 1);

	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 2);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 3);

	if songName == 'scenty' then
		setProperty('boyfriendGroup.y', 100)
		scaleObject('boyfriendGroup', 1.1, 1.1)

		makeAnimatedLuaSprite('bgboppers', 'liam_bryce_bg', 1200,50);
	    addAnimationByPrefix('bgboppers', 'bop', 'liambrycebg', 24, false);
	    setObjectOrder('bgboppers', 3);
	end

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