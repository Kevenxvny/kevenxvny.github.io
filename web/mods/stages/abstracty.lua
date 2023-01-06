function onCreate()

	addCharacterToList('liamabstract', 'dad')
	addCharacterToList('bryceabstract', 'dad')
	addCharacterToList('abstractairy', 'dad')

	precacheImage('black')

	makeLuaSprite('plane', 'abstracty_plane', -200, -500);
	scaleObject('plane', 1.5, 1.5);
	setScrollFactor('plane', 1, 1);
	setProperty('plane.antialiasing', true);
	setObjectOrder('plane', 0);

	makeLuaSprite('aa', 'black', -876, -900)
    setProperty('aa.alpha', 0)
    scaleObject('aa', 5, 5)
    setObjectOrder('aa', 1);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 2);

	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 3);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 4);

	makeAnimatedLuaSprite('ame', 'abstracty_amelia', 1350,770);
    addAnimationByPrefix('ame', 'abstracty_amelia', 'scentybop', 24, true);
    setProperty('ame.antialiasing', true);
    setScrollFactor('ame', 0.65, 0.65)
    scaleObject('ame', 2,2)
    setObjectOrder('ame', 6);

    makeAnimatedLuaSprite('airline', 'abstracty_airlinefood', 800,770);
    addAnimationByPrefix('airline', 'abstracty_airlinefood', 'airlinebop', 24, true);
    setProperty('airline.antialiasing', true);
    setScrollFactor('airline', 0.7, 0.7)
    scaleObject('airline', 2,2)
    setObjectOrder('airline', 7);

    makeAnimatedLuaSprite('liam', 'abstracty_liam', 1750,500);
    addAnimationByPrefix('liam', 'abstracty_liam', 'liambop', 24, true);
    setProperty('liam.antialiasing', true);
    setScrollFactor('liam', 0.6, 0.6)
    scaleObject('liam', 2,2)
    setObjectOrder('liam', 5);

end

function onBeatHit()
    -- triggered 4 times per section
    if curBeat % 2 == 0 then
        playAnim('ame', 'scentybop', true)

  		playAnim('airline', 'airlinebop', true)

        playAnim('liam', 'liambop', true)
    end
end

function onUpdate()
        if curBeat == 104 then
            --doTweenAngle('TAG','VARIABLE',ANGLE VALUE,DURATION,'EASING TYPE');
            --doTweenZoom('TAG','VARIABLE',ZOOM VALUE,DURATION,'EASING TYPE');
            doTweenAlpha('aaa', 'aa', 0.5, 1, 'linear')
        end
        if curBeat == 128 then
            --doTweenAngle('TAG','VARIABLE',ANGLE VALUE,DURATION,'EASING TYPE');
            --doTweenZoom('TAG','VARIABLE',ZOOM VALUE,DURATION,'EASING TYPE');
            doTweenAlpha('aaa', 'aa', 0, 2, 'linear')
        end
        if curBeat == 232 then
            --doTweenAngle('TAG','VARIABLE',ANGLE VALUE,DURATION,'EASING TYPE');
            --doTweenZoom('TAG','VARIABLE',ZOOM VALUE,DURATION,'EASING TYPE');
            doTweenAlpha('aaa', 'aa', 0.5, 1, 'linear')
        end
        if curBeat == 256 then
            --doTweenAngle('TAG','VARIABLE',ANGLE VALUE,DURATION,'EASING TYPE');
            --doTweenZoom('TAG','VARIABLE',ZOOM VALUE,DURATION,'EASING TYPE');
            doTweenAlpha('aaa', 'aa', 0, 2, 'linear')
        end
        if curBeat == 388 then
            --doTweenAngle('TAG','VARIABLE',ANGLE VALUE,DURATION,'EASING TYPE');
            --doTweenZoom('TAG','VARIABLE',ZOOM VALUE,DURATION,'EASING TYPE');
            doTweenAlpha('aaa', 'aa', 0.5, 2, 'linear')
        end
        if curBeat == 420 then
            --doTweenAngle('TAG','VARIABLE',ANGLE VALUE,DURATION,'EASING TYPE');
            --doTweenZoom('TAG','VARIABLE',ZOOM VALUE,DURATION,'EASING TYPE');
            setProperty('dad.alpha', 0)
            setProperty('aa.alpha', 0)
            for i=0,3 do
			   noteTweenAlpha('dieaaa'..i, i, 0, 0.0000000000001, 'linear')
			end
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

