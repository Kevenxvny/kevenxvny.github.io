function onCreate()
    precacheImage('ENOUGHDRUGSbg')
    addCharacterToList('liam_enough', 'boyfriend')
    addCharacterToList('airy_enough', 'dad')
    addCharacterToList('druggedairy', 'dad')
    addCharacterToList('druggedliam', 'boyfriend')
    addCharacterToList('enoughmonospowairy', 'dad')
    addCharacterToList('enoughmonospowliam', 'boyfriend')
    addCharacterToList('enoughspowliam', 'boyfriend')
    addCharacterToList('enoughspowairy', 'dad')
    addCharacterToList('enoughliamangry', 'boyfriend')
    addCharacterToList('enoughlastairy', 'dad')
    addCharacterToList('enoughliamtired', 'boyfriend')

	makeLuaSprite('the_bron_moment', 'the_bron_jame', -744.999999999999, -560);
	scaleObject('the_bron_moment', 1.7, 1.8);
	setScrollFactor('the_bron_moment', 1, 1);
	setProperty('the_bron_moment.antialiasing', true);
	setObjectOrder('the_bron_moment', 0);

    makeLuaSprite('the_bron_moment2', 'the_bron_jame_part_2', -300, 200);
    scaleObject('the_bron_moment2', 2.1, 2.1);
    setScrollFactor('the_bron_moment2', 1, 1);
    setProperty('the_bron_moment2.antialiasing', true);
    setObjectOrder('the_bron_moment2', 8);
    setProperty('the_bron_moment2.alpha', 0.00000000000000000000000000000000000000000000000000001)

    makeLuaSprite('shed', 'shed_enough', 2015, 300)
    scaleObject('shed', 1.95, 1.8)
    setProperty('shed.alpha', 0.00000000000000000000000000000000000001)
    setObjectOrder('shed', 3)

    makeLuaSprite('spowbg', 'plane_enoughbg', 500, 500)
    scaleObject('spowbg',2, 1.8)
    setProperty('spowbg.alpha', 0.00000000000000000000000000000000000000000000000000001)
    setObjectOrder('spowbg', 2)

    makeAnimatedLuaSprite('druggedbg', 'ENOUGHDRUGSbg', -744.999999999999, -560);
    addAnimationByPrefix('druggedbg', 'blackbg', 'blackbg', 24, true);
    setProperty('druggedbg.antialiasing', true);
    setProperty('druggedbg.alpha', 0.00000000000000000000000000000000000000000000000000001)
    scaleObject('druggedbg', 1.7, 1.8);
    setObjectOrder('druggedbg', 1);

    makeLuaSprite('room', 'waiting_room', 300,490);
    scaleObject('room', 2.2, 1.9);
    setProperty('room.antialiasing', true);
    setObjectOrder('room', 6)
    setProperty('room.alpha', 0.00000000000000000000000000000000000000000000000000001)

	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 10);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 11);

	setScrollFactor('boyfriendGroup', 0.80, 0.80);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 12);
end

function onCreatePost()
    triggerEvent('Camera Follow Pos', 900, 700)
end

function onUpdate()
    if curBeat == 14 then
            --doTweenAngle('TAG','VARIABLE',ANGLE VALUE,DURATION,'EASING TYPE');
            --doTweenZoom('TAG','VARIABLE',ZOOM VALUE,DURATION,'EASING TYPE');
            doTweenZoom('screenZoom','camGame', 0.7, 0.5,'linear');
    end
    if curBeat == 16 then
        --doTweenAngle('TAG','VARIABLE',ANGLE VALUE,DURATION,'EASING TYPE');
        --doTweenZoom('TAG','VARIABLE',ZOOM VALUE,DURATION,'EASING TYPE');
        doTweenZoom('screenZoom','camGame', 0.6, 0.5,'expoOut');
    end
    if curBeat == 257 then
        doTweenAlpha('hudgone', 'camHUD', 0, 0.5, 'smoothStepInOut')

        triggerEvent('Camera Follow Pos', '2650', '1500')
    end
    if curBeat == 265 then
        --doTweenX('airyAA2', 'dad', 100, 1, 'backOut')
        --doTweenX('liamAA2', 'boyfriend', 1500, 1, 'backOut')
    end
end

function onEvent(n, v1, v2)
    if n == 'Stage Switch' and string.lower(v1) == 'drugs' then
        removeLuaSprite('the_bron_moment')

        function onMoveCamera(focus)
            if focus == 'dad' then
                setProperty('defaultCamZoom', 0.78)
            elseif focus == 'boyfriend' then
                setProperty('defaultCamZoom', 0.5)
            end
        end

        setProperty('druggedbg.alpha', 1)

        doTweenAlpha('nomorebars', 'bars', 0, 1, 'linear')
    end
    if n == 'Stage Switch' and string.lower(v1) == 'nomoredrugs' then
        removeLuaSprite('druggedbg')
        doTweenAlpha('LETS FUCKING GO THE BARS ARE BACK', 'bars', 1, 1, 'linear')

        function onMoveCamera(focus)
            if focus == 'dad' then
                setProperty('defaultCamZoom', 0.8)
            elseif focus == 'boyfriend' then
                setProperty('defaultCamZoom', 0.6)
            end
        end

    end
    if n == 'Stage Switch' and string.lower(v1) == 'spowthesenuts' then
        removeLuaSprite('druggedbg')
        doTweenAlpha('LETS FUCKING GO THE BARS ARE BACK', 'bars', 1, 1, 'linear')
        
        noteTweenX('defaultPlayerStrumY0', 4, ((screenWidth / 3) - 330) - 0, 2, 'smoothStepInOut')
        noteTweenX('defaultPlayerStrumY1', 5, ((screenWidth / 3) - 220) - 0, 2, 'smoothStepInOut')
        noteTweenX('defaultPlayerStrumY2', 6, ((screenWidth / 3) - 110) - 0, 2, 'smoothStepInOut')
        noteTweenX('defaultPlayerStrumY3', 7, ((screenWidth / 3) + 0) - 0, 2, 'smoothStepInOut')
        noteTweenX('defaultFPlayerStrumY0', 0, ((screenWidth / 3 * 2) - 0) - 100, 2, 'smoothStepInOut')
        noteTweenX('defaultFPlayerStrumY1', 1, ((screenWidth / 3 * 2) + 110) - 100, 2, 'smoothStepInOut')
        noteTweenX('defaultFPlayerStrumY2', 2, ((screenWidth / 3 * 2) + 220) - 100, 2, 'smoothStepInOut')
        noteTweenX('defaultFPlayerStrumY3', 3, ((screenWidth / 3 * 2) + 330) - 100, 2, 'smoothStepInOut')

        setProperty('spowbg.alpha', 1)
        setProperty('shed.alpha', 1)

        function onMoveCamera(focus)
            if focus == 'dad' then
                setProperty('defaultCamZoom', 0.44)
                doTweenAlpha('shedtween', 'shed', 1, 0.5, 'linear')
                doTweenAlpha('spowbgtween', 'spowbg', 1, 0.5, 'linear')
                doTweenAlpha('planebgtween', 'room', 0, 0.5, 'linear')
            elseif focus == 'boyfriend' then
                setProperty('defaultCamZoom', 0.45)
                doTweenAlpha('shedtween', 'shed', 0, 0.5, 'linear')
                doTweenAlpha('spowbgtween', 'spowbg', 0, 0.5, 'linear')
                doTweenAlpha('planebgtween', 'room', 1, 0.5, 'linear')
            end
        end

        setScrollFactor('boyfriendGroup', 1, 1);

        setCharacterX('dad', 3000)
        setCharacterY('dad', 1150)
        setCharacterX('boyfriend', 1500)
        setCharacterY('boyfriend',1400)

    end
    if n == 'Stage Switch' and string.lower(v1) == 'spowthesenutsmono' then
        function onMoveCamera(focus)
            if focus == 'dad' then
                setProperty('defaultCamZoom', 0.38)
            elseif focus == 'boyfriend' then
                setProperty('defaultCamZoom', 0.38)
            end
        end

        removeLuaSprite('shed')
        removeLuaSprite('spowbg')
        removeLuaSprite('room')

        triggerEvent('Change Character', '1', 'enoughmonospowairy')
        triggerEvent('Change Character', '0', 'enoughmonospowliam')

        setCharacterX('dad', 2800)
        setCharacterY('dad', 1000)
    end
    if n == 'Stage Switch' and string.lower(v1) == 'finaltransition' then
        noteTweenX('dad1', 0, 90, 0.5, 'expoIn');
        noteTweenX('dad2', 1, 205, 0.5, 'expoIn');
        noteTweenX('dad3', 2, 315, 0.5, 'expoIn');
        noteTweenX('dad4', 3, 425, 0.5, 'expoIn');
        noteTweenX('bf1', 4, 730, 0.5, 'expoIn');
        noteTweenX('bf2', 5, 845, 0.5, 'expoIn');
        noteTweenX('bf3', 6, 955, 0.5, 'expoIn');
        noteTweenX('bf4', 7, 1065, 0.5, 'expoIn');

        doTweenAlpha('hudback', 'camHUD', 1, 0.5, 'linear')

    end
    if n == 'Stage Switch' and string.lower(v1) == 'finalchange' then
        doTweenColor('healthbarback', 'healthBar', 'FFFFFF', 1, 'linear')
        doTweenColor('bficonback', 'iconP1', 'FFFFFF', 1, 'linear')
        doTweenColor('dadiconback', 'iconP2', 'FFFFFF', 1, 'linear')

        setProperty('the_bron_moment2.alpha', 1)

        triggerEvent('Change Character', '1', 'enoughlastairy')
        triggerEvent('Change Character', '0', 'enoughliamangry')

        setCharacterX('dad', 900)
        setCharacterX('boyfriend', 2300)

        setScrollFactor('dadGroup', 0.9, 0.9);
        setObjectOrder('dadGroup', 16)
        setObjectOrder('boyfriendGroup', 15)


        function onMoveCamera(focus)
            if focus == 'dad' then
                setProperty('defaultCamZoom', 0.38)
            elseif focus == 'boyfriend' then
                setProperty('defaultCamZoom', 0.5)
            end
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

function onMoveCamera(focus)
    if focus == 'dad' then
        setProperty('defaultCamZoom', 0.8)
    elseif focus == 'boyfriend' then
        setProperty('defaultCamZoom', 0.6)
    end
end

