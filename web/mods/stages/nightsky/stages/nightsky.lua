function onCreate()
	makeLuaSprite('bg', 'nightsky', -114.333333333333, -29.3333333333333);
	scaleObject('bg', 1.5, 1.5);
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
	setObjectOrder('boyfriendGroup', 3);

	makeLuaSprite('barrier', 'whitebarrier', -303.636363636364, -134.545454545455);
	scaleObject('barrier', 1.5, 1.5);
	setScrollFactor('barrier', 1, 1);
	setProperty('barrier.antialiasing', true);
	setObjectOrder('barrier', 4);

	close(true);
end