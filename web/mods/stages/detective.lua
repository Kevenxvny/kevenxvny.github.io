function onCreate()
	precacheImage('frequency/campfire')
	precacheImage('frequency/scene1')
	precacheImage('frequency/scene2')
	precacheImage('frequency/scene3')
	precacheImage('frequency/stool')
	addCharacterToList('alex','dad')
	addCharacterToList('alexscene1', 'dad')
	addCharacterToList('alexscene2', 'dad')
	addCharacterToList('alexscene3', 'dad')
	addCharacterToList('detectiveliam', 'boyfriend')
	addCharacterToList('liamscene1', 'boyfriend')
	addCharacterToList('liamscene2', 'boyfriend')
	addCharacterToList('liamscene3', 'boyfriend')

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 7);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 6);

	makeLuaSprite('bg1', 'frequency/scene1', -650, -500);
	setScrollFactor('bg1', 1, 1);
	scaleObject('bg1', 1.3, 1.3)
	setProperty('bg1.antialiasing', true);
	setObjectOrder('bg1', 2);

	makeLuaSprite('bg2', 'frequency/scene2', -100, -500);
	setScrollFactor('bg2', 0.8, 0.8);
	scaleObject('bg2', 1.4, 1.35)
	setProperty('bg2.antialiasing', true);
	setObjectOrder('bg2', 3);
	setProperty('bg2.alpha', 0.00000000000000000000000000000000000000000000000000000001)

	makeLuaSprite('bg3', 'frequency/scene3', -400, -100);
	setScrollFactor('bg3', 1, 1);
	scaleObject('bg3', 1.05, 1.05)
	setProperty('bg3.antialiasing', true);
	setObjectOrder('bg3', 4);
	setProperty('bg3.alpha', 0.00000000000000000000000000000000000000000000000000000001)

	makeLuaSprite('stool', 'frequency/stool', 700, 400);
	setScrollFactor('stool', 1, 1);
	scaleObject('stool', 1.05, 1.05)
	setProperty('stool.antialiasing', true);
	setObjectOrder('stool', 3);

	makeLuaSprite('bg', 'frequency/campfire', -650, -500);
	scaleObject('bg', 1.0, 1.05);
	setScrollFactor('bg', 1, 1);
	setProperty('bg.antialiasing', true);
	setObjectOrder('bg', 0);
	setProperty('bg.alpha', 0.00000000000000000000000000000000000000000000000000000001)

	makeAnimatedLuaSprite('fire', 'frequency/fire', -650,-500);
	addAnimationByPrefix('fire', 'move', 'flame', 24, true);
	scaleObject('fire', 1.0, 1.05)
	setProperty('fire.alpha', 0.00000000000000000000000000000000000000000000000000000001)
	setObjectOrder('fire', 1)

end

function onEvent(n,v1,v2)
	if n == 'Stage Switch' and string.lower(v1) == 'singzoom' then
		function onMoveCamera(focus)
		    if focus == 'dad' then
		        setProperty('defaultCamZoom', 0.9)
		    elseif focus == 'boyfriend' then 
		        setProperty('defaultCamZoom', 0.85)
		    end
		end
	end
	if n == 'Stage Switch' and string.lower(v1) == 'firstswitch' then
		triggerEvent('Change Character', 'boyfriend', 'liamscene2')
		triggerEvent('Change Character', 'dad', 'alexscene2')
		removeLuaSprite('bg1')
		removeLuaSprite('stool')
		setProperty('bg2.alpha', 1)

		setCharacterY('dad', -480)
		setCharacterX('dad', 250)

		function onMoveCamera(focus)
		    if focus == 'dad' then
		        setProperty('defaultCamZoom', 0.8)
		    elseif focus == 'boyfriend' then 
		        setProperty('defaultCamZoom', 0.7)
		    end
		end
	end
	if n == 'Stage Switch' and string.lower(v1) == 'secondswitch' then
		triggerEvent('Change Character', 'boyfriend', 'liamscene3')
		triggerEvent('Change Character', 'dad', 'alexscene3')
		removeLuaSprite('bg2')
		setProperty('bg3.alpha', 1)

		setCharacterY('dad', 100)
		setCharacterX('dad', 100)
		setCharacterX('boyfriend', 700)

		setScrollFactor('boyfriendGroup', 0.9, 0.9);

		function onMoveCamera(focus)
		    if focus == 'dad' then
		        setProperty('defaultCamZoom', 1)
		    elseif focus == 'boyfriend' then 
		        setProperty('defaultCamZoom', 0.81)
		    end
		end
	end
	if n == 'Stage Switch' and string.lower(v1) == 'final' then
		setCharacterX('dad', -340)
		setCharacterY('dad', -200)
		setCharacterX('boyfriend', 610)
		setCharacterY('boyfriend', -200)
		
		setProperty('bg.alpha', 1)
		setProperty('fire.alpha', 1)
		removeLuaSprite('bg3')

		triggerEvent('Change Character', 'boyfriend', 'detectiveliam')
		triggerEvent('Change Character', 'dad', 'alex')

		setScrollFactor('boyfriendGroup', 1, 1);

		function onMoveCamera(focus)
		    if focus == 'dad' then
		        setProperty('defaultCamZoom', 0.95)
		    elseif focus == 'boyfriend' then 
		        setProperty('defaultCamZoom', 0.95)
		    end
		end
	end
end

function onMoveCamera(focus)
    if focus == 'dad' then
        setProperty('defaultCamZoom', 0.9)
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