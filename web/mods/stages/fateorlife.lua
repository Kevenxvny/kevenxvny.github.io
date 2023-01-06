function onCreate()
    makeLuaSprite('black', '', -950, -540)
    makeGraphic('black',1920,100,'000000')
    scaleObject('black', 1.5, 1.4)
    addLuaSprite('black', false)
    setObjectOrder('black', 2)

	makeLuaSprite('oh', 'distortedfatebg', -950, -540);
    setObjectOrder('oh', 1);
    scaleObject('oh', 1.5, 1.4)

    setProperty('dadGroup.antialiasing', true);
    setObjectOrder('dadGroup', 3);

    setProperty('boyfriendGroup.antialiasing', true);
    setObjectOrder('boyfriendGroup', 4);

end

--hello file peeker, i know what you are. go to the data folder for the song for the scripts lol