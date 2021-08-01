function start (song)
	background = makeSprite('bluescreen','bluescreen', true)
	white = makeSprite('White','white', true)
	setActorX(0,'bluescreen')
	setActorX(0,'white')
	setActorY(330,'bluescreen')
	setActorY(315,'white')
	setActorAlpha(0,'bluescreen')
	setActorAlpha(0,'white')
	setActorScale(2.3,'bluescreen')
	setActorScale(2.3,'white')
end
function fadeInAndGo()
	move = false
    for i=0,3 do -- nothing
    end
	tweenFadeIn(background,0,0.6)
	for i = 4, 7 do -- nothing
	end
	tweenFadeIn('girlfriend', 1, 0.6)
end
function fadeOutAndGo() 
	move = false
    for i=0,3 do -- nothing
    end
	tweenFadeIn(background,1,0.6)
	for i = 4, 7 do -- nothing
	end
	tweenFadeIn('girlfriend', 0, 0.6)
end

function unpop()
	tweenFadeOut(white,0,0.15)
end

function pop()
	tweenFadeIn(white,1,0.15,'unpop')
end

function update (elapsed)
	local currentBeat = (songPos / 1000)*(bpm/60)
	if curStep > 127 and curStep < 256 then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi) + 0, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi) + 0, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
	end
	if curStep > 257 and curStep < 352 then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10,i)
		end
	end
	if curStep > 513 and curStep < 640 then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
		end
	end
	if curStep > 513 and curStep < 1024 then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.cos((currentBeat + i*5) * math.pi) + 10 ,i)
		end
	end
	if curStep > 1086 and curStep < 1215 then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi) + 0, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi) + 0, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
	end
	if curStep > 1216 and curStep < 1344 then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
		end
	end
end
function beatHit (beat)

end

function stepHit (step)
	if step == 640 then
        fadeInAndGo()
    end
	if step == 513 then
        fadeOutAndGo()
        swaying = true
    end
	if curStep == 1217 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.3, 'setDefault')
        end
    end
end