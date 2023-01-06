function onCreate()
    precacheImage('plane')
    precacheImage('room')
    precacheImage('room-mono')
    precacheImage('plane_mono')
    addCharacterToList('canonairy', 'dad')
    addCharacterToList('canonairy_mono', 'dad')

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

    makeLuaSprite('blackscreen', '', 0, 0)
    makeGraphic('blackscreen',1280,720,'000000')
    setProperty('blackscreen.alpha', 1)
    setObjectCamera('blackscreen', 'camOther')

    makeAnimatedLuaSprite('plane', 'plane', 623.333333333333, -346.666666666667);
    scaleObject('plane', 0.9, 0.9);
    addAnimationByPrefix('plane', 'float', 'float', 24, true);
    setScrollFactor('plane', 0.85, 0.85);
    setProperty('plane.antialiasing', true);
    setObjectOrder('plane', 4);

    makeAnimatedLuaSprite('plane2', 'plane_mono', 430, -400);
    scaleObject('plane', 0.9, 0.9);
    addAnimationByPrefix('plane2', 'float', 'float', 24, true);
    setScrollFactor('plane2', 0.85, 0.85);
    setProperty('plane2.antialiasing', true);
    setObjectOrder('plane2', 5);

    makeAnimatedLuaSprite('bubble2', 'bfhat_bubble_bnw', 1500, -346.666666666667);
    scaleObject('bubble2', 0.85, 0.85);
    addAnimationByPrefix('bubble2', 'bubble', 'bubble', 24, true);
    setScrollFactor('bubble2', 0.85, 0.85);
    setProperty('bubble2.antialiasing', true);
    setObjectOrder('bubble2', 7);

    makeAnimatedLuaSprite('bubble', 'bfhat_bubble', 1500, -346.666666666667);
    scaleObject('bubble', 0.85, 0.85);
    addAnimationByPrefix('bubble', 'bubble', 'bubble', 24, true);
    setScrollFactor('bubble', 0.85, 0.85);
    setProperty('bubble.antialiasing', true);
    setObjectOrder('bubble', 6);

    makeLuaSprite('room', 'room', -1870, -1330);
    scaleObject('room', 1, 1);
    setScrollFactor('room', 1, 1);
    setProperty('room.antialiasing', true);
    setObjectOrder('room', 0);

    makeLuaSprite('room2', 'room-mono', -1870, -1330);
    scaleObject('room2', 1, 1);
    setScrollFactor('room2', 1, 1);
    setProperty('room2.antialiasing', true);
    setObjectOrder('room2', 1);

    setProperty('plane.alpha', 0.00000001)
    setProperty('plane2.alpha', 0.00000001)
    setProperty('bubble.alpha', 0.00000001)
    setProperty('bubble2.alpha', 0.00000001)
    setProperty('room.alpha', 0.00000001)
    setProperty('room2.alpha', 0.00000001)

end

local off = {25, 25} -- x and y movement force
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
        setProperty('defaultCamZoom', 0.46)
    elseif focus == 'boyfriend' then
        setProperty('defaultCamZoom', 0.7)
    end
end


function onEvent(n,v,b)
    if n == 'Stage Switch' then
        removeLuaSprite('scenty')
        setProperty('defaultCamZoom', 0.3)

    setProperty('plane.alpha', 1)
    setProperty('plane2.alpha', 1)
    setProperty('bubble.alpha', 1)
    setProperty('bubble2.alpha', 1)
    setProperty('room.alpha', 1)
    setProperty('room2.alpha', 1)


    setScrollFactor('gfGroup', 0.95, 0.95);
    setProperty('gfGroup.antialiasing', true);
    setObjectOrder('gfGroup', 2);

    setScrollFactor('dadGroup', 1, 1);
    setProperty('dadGroup.antialiasing', true);
    setObjectOrder('dadGroup', 3);

    setScrollFactor('boyfriendGroup', 0.85, 0.85);
    setObjectOrder('boyfriendGroup', 20);

    setCharacterY('dad', -200)
    setCharacterX('boyfriend', 1030)
    setCharacterY('boyfriend', 40)

        function onMoveCamera(focus)
            if focus == 'dad' then
                setProperty('defaultCamZoom', 0.3)
            elseif focus == 'boyfriend' then
                setProperty('defaultCamZoom', 0.7)
            end
        end
    end


end