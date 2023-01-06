function onCreate()

	precacheImage('black')
    precacheImage('desolationwall')
    precacheImage('desolationplane')
    precacheImage('scentybop')
    precacheImage('brycebop')
    precacheImage('waiting_room')

    addCharacterToList('bfdesolation', 'boyfriend')
    addCharacterToList('evilliam', 'dad')
    addCharacterToList('bfdesolation2', 'boyfriend')
    addCharacterToList('airydesolation', 'dad')

	makeLuaSprite('scenty', 'scenty', -1100, -900);
    scaleObject('scenty', 2, 2);
    setScrollFactor('scenty', 1, 1);
    setProperty('scenty.antialiasing', true);
    setObjectOrder('scenty', 0);

    makeLuaSprite('aa', 'black', 0, 0)
    setProperty('aa.alpha', 0.00000000000000000000000000000000000000000000000000000001)
    setObjectCamera('aa', 'camOther')
    setObjectOrder('aa', 1000)

    setScrollFactor('boyfriendGroup', 1, 1);
    setProperty('boyfriendGroup.antialiasing', true);
    setObjectOrder('boyfriendGroup', 5);

    makeAnimatedLuaSprite('static', 'static', -50, -100);
    addAnimationByPrefix('static', 'static', 'static', 24, true);
    setProperty('static.antialiasing', false);
    setObjectOrder('static', 999);
    scaleObject('static', 3, 2.5)
    setObjectCamera('static', 'camOther')
    setProperty('static.alpha', 0.00000000000000000000000000000000000000000000000000000001)

end

function onEvent(n,v1,v2)
    if n == 'Stage Switch' and string.lower(v1) == 'firstchange' then

            makeLuaSprite('plane', 'desolationplane', -600, -400);
            scaleObject('plane', 1.37, 1.37);
            setScrollFactor('plane', 1, 1);
            setProperty('plane.antialiasing', true);
            setObjectOrder('plane', 3)

            setScrollFactor('dadGroup', 1, 1);
            setProperty('dadGroup.antialiasing', true);
            setObjectOrder('dadGroup', 2);

            makeLuaSprite('bg', 'desolationwall', -600, -500);
            scaleObject('bg', 1.37, 1.37);
            setScrollFactor('bg', 1, 1);
            setProperty('bg.antialiasing', true);
            setObjectOrder('bg', 1)

            makeAnimatedLuaSprite('ame', 'scentybop', -100,700);
            addAnimationByPrefix('ame', 'scentybop', 'scentybop', 24, false);
            setProperty('ame.antialiasing', true);
            setObjectOrder('ame', 11);
            setProperty('ame.alpha', 0)

            makeAnimatedLuaSprite('bry', 'brycebop', 1020, 700);
            addAnimationByPrefix('bry', 'brycebop', 'brycebop', 24, false);
            setProperty('bry.antialiasing', true);
            setObjectOrder('bry', 10);
            setProperty('bry.alpha', 0)

            setProperty('plane.alpha', 1)
            setProperty('bg.alpha', 1)

            removeLuaSprite('room')

            triggerEvent('Change Character', '1', 'evilliam')
            triggerEvent('Change Character', '0', 'bfdesolation')

            setCharacterX('boyfriend',800)
            setCharacterY('boyfriend',50)

            setCharacterX('dad',-1)
            setCharacterY('dad',-7)

            function onMoveCamera(focus)
                if focus == 'dad' then
                    setProperty('defaultCamZoom', 0.55)
                elseif focus == 'boyfriend' then
                    setProperty('defaultCamZoom', 0.75)
                end
            end
    end
    if n == 'Stage Switch' and string.lower(v1) == 'bryceappear' then
        setProperty('bry.alpha', 1)
    end
    if n == 'Stage Switch' and string.lower(v1) == 'ameliaappear' then
        setProperty('ame.alpha', 1)
    end        
    if n == 'Stage Switch' and string.lower(v1) == 'secondchange' then
          
            makeLuaSprite('room', 'waiting_room', -500, -300);
            scaleObject('room', 1.1, 1.1);
            setScrollFactor('room', 1, 1);
            setProperty('room.antialiasing', true);
            setObjectOrder('room', 5)

            setProperty('ame.alpha', 0)
            setProperty('bry.alpha', 0)
            setProperty('plane.alpha', 0)
            setProperty('bg.alpha', 0)

            triggerEvent('Change Character', '1', 'airydesolation')
            triggerEvent('Change Character', '0', 'bfdesolation2')

            setScrollFactor('boyfriendGroup', 1, 1);
            setProperty('boyfriendGroup.antialiasing', true);
            setObjectOrder('boyfriendGroup', 7);

            setScrollFactor('dadGroup', 1, 1);
            setProperty('dadGroup.antialiasing', true);
            setObjectOrder('dadGroup', 6);

            setCharacterX('boyfriend',-1000)
            setCharacterY('boyfriend',-85)

            setCharacterX('dad',400)
            setCharacterY('dad',0)

            function onMoveCamera(focus)
                if focus == 'dad' then
                    setProperty('defaultCamZoom', 0.82)
                elseif focus == 'boyfriend' then
                    setProperty('defaultCamZoom', 0.75)
                end
            end

    end
    if n == 'Play Animation' and string.lower(v1) == 'hi' then
            doTweenX('bfhi', 'boyfriend', -120, 2, 'backOut')
    end
end

function makeBoppersDance()
    playAnim('ame', 'scentybop', true)

    playAnim('bry', 'brycebop', true)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        makeBoppersDance();
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