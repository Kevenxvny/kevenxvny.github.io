function onCreate()

	makeLuaSprite('nothing', 'blackvignette', 0, 0);
    setObjectOrder('nothing', 10);
    setObjectCamera('nothing', 'camOther')

    makeLuaSprite('glow', 'glowlol', 1230, -550)
    setObjectOrder('glow', 1)
    scaleObject('glow', 1.2, 1.2)
    setProperty('glow.alpha', 0.9)


end

function onCreatePost()
    setProperty('boyfriendGroup.alpha', 0)

    noteTweenX('defaultPlayerStrumY0', 4, ((screenWidth / 3) - 330) - 0, 0.5, 'smoothStepInOut')
    noteTweenX('defaultPlayerStrumY1', 5, ((screenWidth / 3) - 220) - 0, 0.5, 'smoothStepInOut')
    noteTweenX('defaultPlayerStrumY2', 6, ((screenWidth / 3) - 110) - 0, 0.5, 'smoothStepInOut')
    noteTweenX('defaultPlayerStrumY3', 7, ((screenWidth / 3) + 0) - 0,0.5, 'smoothStepInOut')
    noteTweenX('defaultFPlayerStrumY0', 0, ((screenWidth / 3 * 2) - 0) - 100, 0.5, 'smoothStepInOut')
    noteTweenX('defaultFPlayerStrumY1', 1, ((screenWidth / 3 * 2) + 110) - 100, 0.5, 'smoothStepInOut')
    noteTweenX('defaultFPlayerStrumY2', 2, ((screenWidth / 3 * 2) + 220) - 100, 0.5, 'smoothStepInOut')
    noteTweenX('defaultFPlayerStrumY3', 3, ((screenWidth / 3 * 2) + 330) - 100, 0.5, 'smoothStepInOut')
end

function onUpdate()
    local songPos = getSongPosition()
    local currentBeat = (songPos / 1000) * (bpm / 200)

    for i = 0, 7 do
        noteTweenY("Wave" .. i, i, defaultPlayerStrumY0 + 3 * math.cos((currentBeat + i * 1.25) * math.pi), 0.001)
    end
end