function onCreate()
    precacheImage('truth');
    makeLuaSprite('truth', 'truth', 1280, 220);
    setObjectCamera('truth', 'camHUD');
    addLuaSprite('truth', true);
    setObjectOrder('truth', 100);
end

function onCreate()
	makeLuaSprite('truth', 'truth', 0, -500);
	scaleObject('truth', 3.2, 3.2);
	setScrollFactor('truth', 1, 1);
	setProperty('truth.antialiasing', true);
	setObjectOrder('truth', 0);

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
camMovement = 8
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