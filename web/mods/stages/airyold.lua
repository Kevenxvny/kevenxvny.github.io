function onCreate()
    precacheImage('space')
    precacheImage('space_mono')
    precacheImage('scenty')
    precacheImage('plane')
    precacheImage('plane_mono')

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

end

campointx = 0
campointy = 0
bfturn = false
camMovement = 18
velocity = 3.5

function onMoveCamera(focus)

    if focus == 'boyfriend' then
        campointx = getProperty('camFollow.x')
        campointy = getProperty('camFollow.y')
        bfturn = true
    elseif focus == 'dad' then
        campointx = getProperty('camFollow.x')
        campointy = getProperty('camFollow.y')
        bfturn = false
        setProperty('cameraSpeed', 5)    
    end
end

function onUpdatePost(elapsed)

    if bfturn then
    	setProperty('defaultCamZoom', 0.7)
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
        setProperty('cameraSpeed', velocity)
    end

    if not bfturn then
    	setProperty('defaultCamZoom', 0.46)
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
        setProperty('cameraSpeed', velocity)
    end

end


function onEvent(n,value1,value2)
    if n == 'Stage Switch' then
        setProperty('boyfriendGroup.x', 1030)

        removeLuaSprite('scenty');
        setProperty('defaultCamZoom', 0.3);

    makeLuaSprite('space2', 'space_mono', -1870, -1330);
    scaleObject('space2', 7, 7);
    setProperty('space2.antialiasing', true);
    setObjectOrder('space2', 1);

    makeLuaSprite('space1', 'space', -1870, -1330);
    scaleObject('space1', 7, 7);
    setProperty('space1.antialiasing', true);
    setObjectOrder('space1', 0);

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

    setScrollFactor('dadGroup', 1, 1);
    setProperty('dadGroup.antialiasing', true);
    setObjectOrder('dadGroup', 3);

    makeAnimatedLuaSprite('bubble', 'bfhat_bubble', 1500, -346.666666666667);
    scaleObject('bubble', 0.85, 0.85);
    addAnimationByPrefix('bubble', 'bubble', 'bubble', 24, true);
    setScrollFactor('bubble', 0.85, 0.85);
    setProperty('bubble.antialiasing', true);
    setObjectOrder('bubble', 8);

    makeAnimatedLuaSprite('bubble2', 'bfhat_bubble_bnw', 1500, -346.666666666667);
    scaleObject('bubble2', 0.85, 0.85);
    addAnimationByPrefix('bubble2', 'bubble', 'bubble', 24, true);
    setScrollFactor('bubble2', 0.85, 0.85);
    setProperty('bubble2.antialiasing', true);
    setObjectOrder('bubble2', 9);

    setScrollFactor('boyfriendGroup', 0.85, 0.85);
    setProperty('boyfriendGroup.antialiasing', true);
    setObjectOrder('boyfriendGroup', 10);
    

        campointx = 0
        campointy = 0
        bfturn = false
        camMovement = 20
        velocity = 2

        function onUpdatePost(elapsed)

            if bfturn then
                setProperty('defaultCamZoom', 0.7)
            end

            if not bfturn then
                setProperty('defaultCamZoom', 0.3)
            end

        end
    end
end