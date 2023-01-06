function onCreate()
	makeLuaSprite('bradley', 'bradley', -670, -500);
	scaleObject('bradley', 1.6, 1.3);
	setScrollFactor('bradley', 1, 1);
	setProperty('bradley.antialiasing', true);
	setObjectOrder('bradley', 0);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 1);

	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 2);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 3);

	if isStoryMode then

	makeLuaSprite('dialoguescene1', 'dialoguebgs/carnitas1', 0, 0)
    setObjectCamera('dialoguescene1', 'camHUD')
    setProperty('dialoguescene1.alpha', 1)
    setObjectOrder('dialoguescene1', 10)

    makeLuaSprite('dialoguescene2', 'dialoguebgs/carnitas2', 0, 0)
    setObjectCamera('dialoguescene2', 'camHUD')
    setProperty('dialoguescene2.alpha', 0)
    setObjectOrder('dialoguescene2', 11)

    makeLuaSprite('dialoguescene3', 'dialoguebgs/carnitas3', 0, 0)
    setObjectCamera('dialoguescene3', 'camHUD')
    setProperty('dialoguescene3.alpha', 0)
    setObjectOrder('dialoguescene3', 13)

    makeLuaSprite('dialoguescene4', 'dialoguebgs/carnitas4', 0, 0)
    setObjectCamera('dialoguescene4', 'camHUD')
    setProperty('dialoguescene4.alpha', 0)
    setObjectOrder('dialoguescene4', 14)

    makeLuaSprite('dialoguescenebefore5', 'dialoguebgs/carnitasprehit', 0, 0)
    setObjectCamera('dialoguescenebefore5', 'camHUD')
    setProperty('dialoguescenebefore5.alpha', 0)
    setObjectOrder('dialoguescenebefore5', 15)

    makeLuaSprite('dialoguescene5', 'dialoguebgs/carnitas5', 0, 0)
    setObjectCamera('dialoguescene5', 'camHUD')
    setProperty('dialoguescene5.alpha', 0)
    setObjectOrder('dialoguescene5', 16)

    makeLuaSprite('lol', 'dialoguebgs/carnitasaa', 0, 0)
    setObjectCamera('lol', 'camHUD')
    setProperty('lol.alpha', 0)
    setObjectOrder('lol', 17)

    makeLuaSprite('dialoguescene6', 'dialoguebgs/carnitas6', 0, 0)
    setObjectCamera('dialoguescene6', 'camHUD')
    setProperty('dialoguescene6.alpha', 0)
    setObjectOrder('dialoguescene6', 18)

    makeLuaSprite('dialoguescene7', 'dialoguebgs/carnitas7', 0, 0)
    setObjectCamera('dialoguescene7', 'camHUD')
    setProperty('dialoguescene7.alpha', 0)
    setObjectOrder('dialoguescene7', 19)

    makeLuaSprite('dialoguescenewhat', 'dialoguebgs/carnitasliamgone', 0, 0)
    setObjectCamera('dialoguescenewhat', 'camHUD')
    setProperty('dialoguescenewhat.alpha', 0)
    setObjectOrder('dialoguescenewhat', 20)

    makeLuaSprite('dialoguesceneradio', 'dialoguebgs/carnitaskys', 0, 0)
    setObjectCamera('dialoguesceneradio', 'camHUD')
    setProperty('dialoguesceneradio.alpha', 0)
    setObjectOrder('dialoguesceneradio', 21)

    makeLuaSprite('dialoguescene8', 'dialoguebgs/carnitas8', 0, 0)
    setObjectCamera('dialoguescene8', 'camHUD')
    setProperty('dialoguescene8.alpha', 0)
    setObjectOrder('dialoguescene8', 22)

    makeLuaSprite('black', '', 0, 0);
  	makeGraphic('black',1280,720,'000000')
  	setProperty('black.alpha', 0)
  	setObjectCamera('black','camHUD')
  	setObjectOrder('black', 23)

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