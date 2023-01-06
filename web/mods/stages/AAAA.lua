function onCreate()

	precacheImage('black')

    makeLuaSprite('aa', 'black', 0, 0)
    setProperty('aa.alpha', 0)
    setObjectCamera('aa', 'camOther')
    setObjectOrder('aa', 1000)

    setScrollFactor('boyfriendGroup', 1, 1);
    setProperty('boyfriendGroup.antialiasing', true);
    setObjectOrder('boyfriendGroup', 5);

    makeLuaSprite('plane', 'desolationplane', -600, -400);
    scaleObject('plane', 1.37, 1.37);
    setScrollFactor('plane', 1, 1);
    setProperty('plane.antialiasing', true);
    setObjectOrder('plane', 4)

    setScrollFactor('dadGroup', 1, 1);
    setProperty('dadGroup.antialiasing', true);
    setObjectOrder('dadGroup', 3);

    makeLuaSprite('bg', 'desolationwall', -600, -500);
    scaleObject('bg', 1.37, 1.37);
    setScrollFactor('bg', 1, 1);
    setProperty('bg.antialiasing', true);
    setObjectOrder('bg', 1)

    makeAnimatedLuaSprite('ame', 'scentybop', -100,700);
    addAnimationByPrefix('ame', 'scentybop', 'scentybop', 24, true);
    setProperty('ame.antialiasing', true);
    setObjectOrder('ame', 11);

    makeAnimatedLuaSprite('bry', 'brycebop', 1020, 700);
    addAnimationByPrefix('bry', 'brycebop', 'brycebop', 24, true);
    setProperty('bry.antialiasing', true);
    setObjectOrder('bry', 10);

    setCharacterY('dad',1000)

    makeLuaSprite('whitebg', '', 0, 0)
    setScrollFactor('whitebg', 0, 0)
    makeGraphic('whitebg', 3840, 2160, 'FF0000')
    addLuaSprite('whitebg', false)
    setProperty('whitebg.alpha', 0)
    screenCenter('whitebg', 'xy')
    setObjectOrder('whitebg', 2)

    function opponentNoteHit()
        cameraShake("camGame", 0.01, 0.2)
        cameraShake("camHUD", 0.01, 0.2)
    end    
end

function onBeatHit()
    -- triggered 4 times per section
    if curBeat % 2 == 0 then
        objectPlayAnimation('ame', 'scentybop', true)

        objectPlayAnimation('bry', 'brycebop', true)
    end
end

function onCreatePost()
    doTweenY('liamrise', 'dad', -290, 16, 'smootherStepInOut')
end

campointx = 0
campointy = 0
bfturn = false
camMovement = 25

function onMoveCamera(focus)

    if focus == 'boyfriend' then
        campointx = getProperty('camFollow.x')
        campointy = getProperty('camFollow.y')
        bfturn = true
    elseif focus == 'dad' then
        campointx = getProperty('camFollow.x')
        campointy = getProperty('camFollow.y')
        bfturn = false
        setProperty('cameraSpeed', 2)    
    end
end

function onUpdatePost(elapsed)

    if bfturn then
        setProperty('defaultCamZoom', 0.75)
        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            setProperty('camFollow.x', campointx)
            setProperty('camFollow.y', campointy)
        elseif getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
            setProperty('camFollow.x', campointx - camMovement)
        elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
            setProperty('camFollow.y', campointy + camMovement)
        elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
            setProperty('camFollow.y', campointy - camMovement)
        elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
            setProperty('camFollow.x', campointx + camMovement)
        end
    end

    if not bfturn then
        setProperty('defaultCamZoom', 0.55)
        if getProperty('dad.animation.curAnim.name') == 'idle' then
            setProperty('camFollow.x', campointx)
            setProperty('camFollow.y', campointy)
        elseif getProperty('dad.animation.curAnim.name') == 'singLEFT' then
            setProperty('camFollow.x', campointx - camMovement)
        elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' then
            setProperty('camFollow.y', campointy + camMovement)
        elseif getProperty('dad.animation.curAnim.name') == 'singUP' then
            setProperty('camFollow.y', campointy - camMovement)
        elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
            setProperty('camFollow.x', campointx + camMovement)
        end
    end

end

function onUpdate()
        --[==[if curBeat == 104 then
            --doTweenAngle('TAG','VARIABLE',ANGLE VALUE,DURATION,'EASING TYPE');
            --doTweenZoom('TAG','VARIABLE',ZOOM VALUE,DURATION,'EASING TYPE');
            doTweenAlpha('aaa', 'aa', 0.5, 1, 'linear')
        end]==]
end

