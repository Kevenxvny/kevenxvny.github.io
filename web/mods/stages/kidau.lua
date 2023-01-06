function onCreate()
		addCharacterToList('charlotte-masked', 'dad')

		makeLuaSprite('bg', 'frightbg', -400, -100);
		setObjectOrder('bg',1)
    scaleObject('bg', 1.6, 1.6)

    setScrollFactor('boyfriendGroup', 0.95, 0.95)
    setCharacterX('boyfriend', 1500)
    setCharacterY('boyfriend', 230) 
end

function onSongStart()
	doTweenX('liammove', 'boyfriend', 700, 5, 'expoOut')
	doTweenY('liamup', 'boyfriend', 450, 5, 'expoOut') -- idk why it made me go more up but it's fine
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

function onMoveCamera(focus)
	    if focus == 'dad' then
	        setProperty('defaultCamZoom', 0.9)
	    elseif focus == 'boyfriend' then 
	        setProperty('defaultCamZoom', 0.87)
	    end
end

function onUpdate()
		if curBeat == 297 then
			doTweenZoom('lol', 'camGame', 1.1, 1, 'expoOut')
			setProperty('defaultCamZoom', 1.1)
			setProperty('focus', 'dad')
		end
		if curBeat == 304 then
			doTweenZoom('lol2', 'camGame', 0.9, 2, 'expoOut')
			setProperty('defaultCamZoom', 0.9)
		end
end