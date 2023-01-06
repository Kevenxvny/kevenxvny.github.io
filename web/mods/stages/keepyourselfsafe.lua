function onCreate()
    precacheImage('illusethisfortheirattention/nothing')

	makeLuaSprite('nothing', 'illusethisfortheirattention/nothing', -13713, -5000);
    scaleObject('nothing', 1370, 1370);
    setObjectOrder('nothing', 1);


    makeAnimatedLuaSprite('mol', 'illusethisfortheirattention/mol', 1600, -300);
    addAnimationByPrefix('mol', 'playing', 'playing', 24, true);
    setProperty('mol.antialiasing', true);
    setObjectOrder('mol', 2);

    makeAnimatedLuaSprite('ame', 'illusethisfortheirattention/ame', 900, -300);
    addAnimationByPrefix('ame', 'playing', 'playing', 24, true);
    setProperty('ame.antialiasing', true);
    setObjectOrder('ame', 3);
end

local campointx = 0
local campointy = 0
local bfturn = false
local camMovement = 15
local velocity = 2

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
        setProperty('defaultCamZoom', 0.9)
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
        setProperty('defaultCamZoom', 0.5)
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