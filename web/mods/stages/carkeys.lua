function onCreate()
	makeLuaSprite('bg', 'carkeysbgnew', -470, -470);
	scaleObject('bg', 1, 1);
	setScrollFactor('bg', 1, 1);
	setProperty('bg.antialiasing', true);
	setObjectOrder('bg', 0);

	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 1);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 2);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 4);

	setProperty('gf.alpha', 0)

	makeLuaSprite('note', 'youplayas', 200, 200)
    setObjectOrder('note', 8)

end

function onSongStart()
    runTimer('waiting wtf', 2)
end

function onTimerCompleted(tag)
    if tag == 'waiting wtf' then
        doTweenY('notemove', 'note', 800, 2, 'smoothStepInOut')
        doTweenAngle('noteturn', 'note', 360, 2, 'smoothStepInOut')

        runTimer('gone', 4)
    end
    if tag == 'gone' then
        removeLuaSprite('note')
    end
end

function onUpdate()
    noteTweenX('defaultPlayerStrumY0', 4, ((screenWidth / 3) - 330) - 0, 0.1, 'linear')
    noteTweenX('defaultPlayerStrumY1', 5, ((screenWidth / 3) - 220) - 0, 0.1, 'linear')
    noteTweenX('defaultPlayerStrumY2', 6, ((screenWidth / 3) - 110) - 0, 0.1, 'linear')
    noteTweenX('defaultPlayerStrumY3', 7, ((screenWidth / 3) + 0) - 0,0.1, 'linear')
    noteTweenX('defaultFPlayerStrumY0', 0, ((screenWidth / 3 * 2) - 0) - 100, 0.1, 'linear')
    noteTweenX('defaultFPlayerStrumY1', 1, ((screenWidth / 3 * 2) + 110) - 100, 0.1, 'linear')
    noteTweenX('defaultFPlayerStrumY2', 2, ((screenWidth / 3 * 2) + 220) - 100, 0.1, 'linear')
    noteTweenX('defaultFPlayerStrumY3', 3, ((screenWidth / 3 * 2) + 330) - 100, 0.1, 'linear')
end

function onUpdatePost(elapsed)
	songPos = getSongPosition() / 300
	P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
	P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
	setProperty('iconP1.x',P1Mult - 75)
	setProperty('iconP1.origin.x',240)
	setProperty('iconP1.flipX',true)
	setProperty('iconP2.x',P2Mult + 110)
	setProperty('iconP2.origin.x',-100)
	setProperty('iconP2.flipX',true)
	setProperty('healthBar.flipX',true)
end