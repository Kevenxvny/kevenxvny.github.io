--do not look at this code, it'll give you cancer lmfao





































sprite = 'argument/buildings'
size = -6504
startX = -2000
startY = 200
duration = 4

spriteAA = 'argument/background_buildings'
sizeAA = -5020
startXAA = -500
startYAA = 0
durationAA = 5

spriteWTF = 'argument/sidewalk'
sizeWTF = -8000
startXWTF = -2000
startYWTF = 150
durationWTF = 3


function onCreate()

    addCharacterToList('boyfriend','liamargument1')
    addCharacterToList('boyfriend','liamargument2')
    addCharacterToList('boyfriend','liamargument3')
    addCharacterToList('dad','bryce_argument_1')
    addCharacterToList('dad','bryce_argument_2')

	makeLuaSprite('bg1', 'argument/argument_bg1', -800, -200);
    scaleObject('bg1', 0.8, 0.8)

    makeAnimatedLuaSprite('liamlegs', 'characters/liam_argument_2', -420, 820);
    addAnimationByPrefix('liamlegs', 'characters/liam_argument_2', 'liam legs run', 24, true);
    setProperty('liamlegs.alpha', 0)

    makeAnimatedLuaSprite('rain', 'argument/argumentrain', -700, -100);
    addAnimationByPrefix('rain', 'argument/argumentrain', 'rain', 24, true);
    scaleObject('rain', 2, 2)

    makeAnimatedLuaSprite('brycelegs', 'characters/bryce_argument_2', 300, 810);
    addAnimationByPrefix('brycelegs', 'characters/bryce_argument_2', 'bryce legs run', 24, true);
    setProperty('brycelegs.alpha', 0000000000000000000000000000000000.1)

    makeLuaSprite(spriteAA .. '12', spriteAA, startXAA, startYAA)
    addLuaSprite(spriteAA .. '12', false)
    makeLuaSprite(spriteAA .. '22', spriteAA, startXAA + sizeAA, startYAA)
    addLuaSprite(spriteAA .. '22', false)

    makeLuaSprite(spriteAA .. '1speed2', spriteAA, startXAA, startYAA)
    addLuaSprite(spriteAA .. '1speed2', false)
    makeLuaSprite(spriteAA .. '2speed2', spriteAA, startXAA + sizeAA, startYAA)
    addLuaSprite(spriteAA .. '2speed2', false)

    setProperty('argument/background_buildings1speed2.alpha', 0.00000000000000000000000000000000000000000000000000000001)
    setProperty('argument/background_buildings2speed2.alpha', 0.00000000000000000000000000000000000000000000000000000001)
    scrollA5()
    scrollA25()

    makeLuaSprite(sprite .. '1', sprite, startX, startY)
    addLuaSprite(sprite .. '1', false)
    makeLuaSprite(sprite .. '2', sprite, startX + size, startY)
    addLuaSprite(sprite .. '2', false)

    makeLuaSprite(sprite .. '1speed', sprite, startX, startY)
    addLuaSprite(sprite .. '1speed', false)
    makeLuaSprite(sprite .. '2speed', sprite, startX + size, startY)
    addLuaSprite(sprite .. '2speed', false)

    setProperty('argument/buildings1speed.alpha', 0.00000000000000000000000000000000000000000000000000000001)
    setProperty('argument/buildings2speed.alpha', 0.00000000000000000000000000000000000000000000000000000001)
    scrollA()
    scrollA2()

    makeLuaSprite('road', 'argument/street', -1700, 870);
    addLuaSprite('road', false)
    scaleObject('road', 1, 1.25)

    makeLuaSprite(spriteWTF .. '13', spriteWTF, startXWTF, startYWTF)
    addLuaSprite(spriteWTF .. '13', true)
    makeLuaSprite(spriteWTF .. '23', spriteWTF, startXWTF + sizeWTF, startYWTF)
    addLuaSprite(spriteWTF .. '23', true)

    makeLuaSprite(spriteWTF .. '1speed3', spriteWTF, startXWTF, startYWTF)
    makeLuaSprite(spriteWTF .. '2speed3', spriteWTF, startXWTF + size, startYWTF)

    setProperty('argument/sidewalk1speed3.alpha', 0.00000000000000000000000000000000000000000000000000000001)
    setProperty('argument/sidewalk2speed3.alpha', 0.00000000000000000000000000000000000000000000000000000001)

    makeLuaSprite('sky', 'argument/SKY', -1500, -460);
    setObjectOrder('sky', 1);
    scaleObject('sky', 1.8, 2)
    setScrollFactor('sky', 0.05, 0.05)

    makeLuaSprite('stack', 'argument/smokestack', -1300, 200)
    setProperty('stack.alpha', 0)
    scaleObject('stack', 0.55, 0.55)

    makeLuaSprite('fence', 'argument/fence', -1300, 100)
    setProperty('fence.alpha', 0)
    scaleObject('fence', 0.55, 0.55)

    makeLuaSprite('ground', 'argument/ground', -1300, 200)
    setProperty('ground.alpha', 0)
    scaleObject('ground', 0.55, 0.55)

    makeLuaSprite('black', '', 0, 0)
    makeGraphic('black',1280,720,'000000')
    setProperty('black.alpha', 0.00000000000000000000000000000000000000000000000000000001)
    setObjectCamera('black', 'camOther')

    addLuaSprite('brycelegs')
    addLuaSprite('liamlegs')
    addLuaSprite('bg1', false)
    addLuaSprite('ground')
    addLuaSprite('stack')
    addLuaSprite('fence')
    addLuaSprite('rain', true)
    addLuaSprite('black', true)

end

function onSongStart()
    for i = 0, 7 do
      noteTweenAlpha('die'..i, i, 0.5, 1, 'linear')
    end
end

function scrollA()
    doTweenX(sprite .. '1move',sprite .. '1', startX - size, duration)
    doTweenX(sprite .. '2move',sprite .. '2', startX, duration)
end

function scrollA2()
    doTweenX(sprite .. '1moveSpeed',sprite .. '1speed', startX - size, 2)
    doTweenX(sprite .. '2moveSpeed',sprite .. '2speed', startX, 2)
end


function scrollA5()
    doTweenX(spriteAA .. '1move2',spriteAA .. '12', startXAA - sizeAA, durationAA)
    doTweenX(spriteAA .. '2move2',spriteAA .. '22', startXAA, durationAA)
end

function scrollA25()
    doTweenX(spriteAA .. '1moveSpeed2',spriteAA .. '1speed2', startXAA - sizeAA, 2)
    doTweenX(spriteAA .. '2moveSpeed2',spriteAA .. '2speed2', startXAA, 2)
end

function scrollA6()
    doTweenX(spriteWTF .. '1move3',spriteWTF .. '13', startXWTF - sizeWTF, durationWTF)
    doTweenX(spriteWTF .. '2move3',spriteWTF .. '23', startXWTF, durationWTF)
end

function scrollA26()
    doTweenX(spriteWTF .. '1moveSpeed3',spriteWTF .. '1speed3', startXWTF - sizeWTF, 2)
    doTweenX(spriteWTF .. '2moveSpeed3',spriteWTF .. '2speed3', startXWTF, 2)
end

function onTweenCompleted(tag)
    if tag == (sprite .. '2move') then
        scrollB()
    end
    if tag == (sprite .. '2move2') then
        scrollA()
    end

    if tag == (sprite .. '2moveSpeed') then
        scrollB2()
    end
    if tag == (sprite .. '2move2Speed') then
        scrollA2()
    end

    --

    if tag == (spriteAA .. '2move2') then
        scrollB5()
    end
    if tag == (spriteAA .. '2move22') then
        scrollA5()
    end

    if tag == (spriteAA .. '2moveSpeed2') then
        scrollB25()
    end
    if tag == (spriteAA .. '2move2Speed2') then
        scrollA25()
    end

    --

    if tag == (spriteWTF .. '2move3') then
        scrollB6()
    end
    if tag == (spriteWTF .. '2move23') then
        scrollA6()
    end

    if tag == (spriteWTF .. '2moveSpeed3') then
        scrollB26()
    end
    if tag == (spriteWTF .. '2move2Speed3') then
        scrollA26()
    end
end

function scrollB()
    doTweenX(sprite .. '1move2',sprite .. '1', startX, 0.001)
    doTweenX(sprite .. '2move2',sprite .. '2', startX + size, 0.001)
end

function scrollB2()
    doTweenX(sprite .. '1move2Speed',sprite .. '1speed', startX, 0.001)
    doTweenX(sprite .. '2move2Speed',sprite .. '2speed', startX + size, 0.001)
end


function scrollB5()
    doTweenX(spriteAA .. '1move22',spriteAA .. '12', startXAA, 0.001)
    doTweenX(spriteAA .. '2move22',spriteAA .. '22', startXAA + sizeAA, 0.001)
end

function scrollB25()
    doTweenX(spriteAA .. '1move2Speed2',spriteAA .. '1speed2', startXAA, 0.001)
    doTweenX(spriteAA .. '2move2Speed2',spriteAA .. '2speed2', startXAA + sizeAA, 0.001)
end

function scrollB6()
    doTweenX(spriteWTF .. '1move23',spriteWTF .. '13', startXWTF, 0.001)
    doTweenX(spriteWTF .. '2move23',spriteWTF .. '23', startXWTF + sizeWTF, 0.001)
end

function scrollB26()
    doTweenX(spriteWTF .. '1move2Speed3',spriteWTF .. '1speed3', startXWTF, 0.001)
    doTweenX(spriteWTF .. '2move2Speed3',spriteWTF .. '2speed3', startXWTF + sizeWTF, 0.001)
end


function onEvent(n,v1,v2)
    if n == 'Stage Switch' and string.lower(v1) == 'firstchange' then
        setProperty('brycelegs.alpha', 1)
        setProperty('liamlegs.alpha', 1)

        triggerEvent('Change Character', '0', 'liamargument2')
        triggerEvent('Change Character', '1', 'bryce_argument2')

        setCharacterY('dad',150)
        setCharacterY('boyfriend',438)

        setProperty('rain.x', -1350)
        setProperty('rain.y', -170)

        setProperty('defaultCamZoom', 0.6)
        setProperty('bg1.alpha', )

        function onUpdate(elapsed)
            if curStep >= 0 then
              songPos = getSongPosition()
              local currentBeat = (songPos/1000)*(bpm/120)
              doTweenX('kys', 'boyfriend', -500-100*math.sin((currentBeat*0.10)*math.pi),0.001)
              doTweenX('kys2', 'liamlegs', -500-100*math.sin((currentBeat*0.10)*math.pi),0.001)
              doTweenX('die', 'dad', 600-100*math.sin((currentBeat*0.25)*math.pi),0.001)
              doTweenX('die2', 'brycelegs', 670-100*math.sin((currentBeat*0.25)*math.pi),0.001)
            end
        end

        noteTweenX('defaultPlayerStrumY0', 4, ((screenWidth / 3) - 330) - 0, 1, 'smoothStepInOut')
        noteTweenX('defaultPlayerStrumY1', 5, ((screenWidth / 3) - 220) - 0, 1, 'smoothStepInOut')
        noteTweenX('defaultPlayerStrumY2', 6, ((screenWidth / 3) - 110) - 0, 1, 'smoothStepInOut')
        noteTweenX('defaultPlayerStrumY3', 7, ((screenWidth / 3) + 0) - 0, 1, 'smoothStepInOut')
        noteTweenX('defaultFPlayerStrumY0', 0, ((screenWidth / 3 * 2) - 0) - 100, 1, 'smoothStepInOut')
        noteTweenX('defaultFPlayerStrumY1', 1, ((screenWidth / 3 * 2) + 110) - 100, 1, 'smoothStepInOut')
        noteTweenX('defaultFPlayerStrumY2', 2, ((screenWidth / 3 * 2) + 220) - 100, 1, 'smoothStepInOut')
        noteTweenX('defaultFPlayerStrumY3', 3, ((screenWidth / 3 * 2) + 330) - 100, 1, 'smoothStepInOut')

        addLuaSprite(spriteWTF .. '2speed3', true)
        addLuaSprite(spriteWTF .. '1speed3', true)
        scrollA6()
        scrollA26()
    end
    if n == 'Stage Switch' and string.lower(v1) == 'lastchange' then
            setCharacterX('dad', -1540)
            setCharacterY('boyfriend', 630)
            setCharacterX('boyfriend', -1100)
            setProperty('dadGroup.alpha', 0)
            removeLuaSprite('liamlegs')
            removeLuaSprite('brycelegs')
           triggerEvent('Change Character', '0', 'liamargument3')
           setProperty('defaultCamZoom', 0.92)

           setProperty('stack.alpha', 1)
           setProperty('fence.alpha', 1)
           setProperty('ground.alpha', 1)

        noteTweenX('dad1', 0, 90, 1, 'smoothStepInOut');
        noteTweenX('dad2', 1, 205, 1, 'smoothStepInOut');
        noteTweenX('dad3', 2, 315, 1, 'smoothStepInOut');
        noteTweenX('dad4', 3, 425, 1, 'smoothStepInOut');
        noteTweenX('bf1', 4, 730, 1, 'smoothStepInOut');
        noteTweenX('bf2', 5, 845, 1, 'smoothStepInOut');
        noteTweenX('bf3', 6, 955, 1, 'smoothStepInOut');
        noteTweenX('bf4', 7, 1065, 1, 'smoothStepInOut');

        function onUpdate(elapsed)
            cancelTween('kys')
            cancelTween('die')
            removeLuaSprite(sprite .. '1')
            removeLuaSprite(sprite .. '2')
            removeLuaSprite(spriteAA .. '12')
            removeLuaSprite(spriteAA .. '22')
            removeLuaSprite(spriteWTF .. '13')
            removeLuaSprite(spriteWTF .. '23')
            removeLuaSprite('argument/sidewalk')

            if curBeat == 266 then
                doTweenAlpha('fadein', 'black', 1, 4, 'smoothStepInOut')
            end
        end
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