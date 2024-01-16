function 作战出发前往()
	
	tap(GetPoint("节点出发前往"))
    sleep(1000)
    
    if cmpColorEx(GetColor("肉鸽空编队"),0.9) == 1 then
		tap(GetPoint("快速编队"))
    	sleep(1000)
    	tap(GetPoint("快速编队干员列表1"))
    	sleep(1000)
    	tap(GetPoint("快速编队干员技能2"))
    	sleep(1000)
    	tap(GetPoint("快速编队确认"))
    	sleep(1000)
    end
	tap(GetPoint("开始行动"))
	sleep(1000)

end

--1=上，2=左，3=下，4=右
function 放置干员(index,x,y)
    tap(GetPoint("干员列表1"))
    sleep(1000)
	touchDown(1,GetPoint("干员列表1"))
	sleep(50)
	touchMoveEx(1,x,y,3000)
	touchUp(1)
    
    sleep(1000)
    
	touchDown(1,x,y)
	sleep(50)
    
    if index == 1 then
    	touchMoveEx(1,x + 200,y,800)
    elseif index == 2 then
    	touchMoveEx(1,x,y - 200,800)
    elseif index == 3 then
		touchMoveEx(1,x - 200,y,800)
    elseif index == 4 then
    	touchMoveEx(1,x,y + 200,800)
    end
	touchUp(1)
	
end

function 开启技能(x,y)
	
    sleep(4500)
    tap(x,y)
    sleep(500)
    tap(320,828)
    
end

function 判断是否正式进入关卡()
	
   	while true do
    	if cmpColorEx(GetColor("保护目标图标"),0.9) == 1 then
        	log("正式进入关卡")
        	return
        end
    	sleep(1000)
    end
    
end