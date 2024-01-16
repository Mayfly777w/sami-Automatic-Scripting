function 官服登录至主页()
	
    log("开始登陆官服")
    runApp(GetChannel("官服"))
    sleep(1000)
	确保登录至终端()
    
end

function B服登录至主页()
	
	log("开始登陆B服")
	runApp(GetChannel("B服"))
	sleep(1000)
	确保登录至终端()
    
end

function 重启官服登录至主页()
	
    log("开始登陆官服")
    stopApp(GetChannel("官服"))
    sleep(1000)
    runApp(GetChannel("官服"))
	确保登录至终端()
    
end

function 重启B服登录至主页()
	
	log("开始登陆B服")
    stopApp(GetChannel("B服"))
	sleep(1000)
	runApp(GetChannel("B服"))
	确保登录至终端()
    
end

function 确保登录至终端()
	
    while true do
		if cmpColorEx(GetColor("关闭主页公告"),0.9) == 1 then
			log("关闭主页公告")
			tap(GetPoint("关闭主页公告"))
		end
        
		if cmpColorEx(GetColor("终端"),0.9) == 1 then
			log("保险：确认到达终端页面")
            sleep(1000)
            if cmpColorEx(GetColor("终端"),0.9) == 1 then
            	log("保险：到达终端页面")
				return
            else
            	log("保险：未到达终端页面")
            end
		end
        
        if cmpColorEx(GetColor("开始唤醒"),0.9) == 1 then
        	log("开始唤醒")
            tap(GetPoint("开始唤醒"))
        end
		
        if cmpColorEx(GetColor("返回与导航界面"),0.9) == 1 then
        	tap(GetPoint("导航"))
            sleep(1000)
            tap(GetPoint("导航_首页"))
        end
        
        if cmpColorEx(GetColor("资源检测界面"),0.9) == 1 then
        	log("资源检测界面")
            tap(GetPoint("开始唤醒"))
        end
        
        if cmpColorEx(GetColor("B服确认"),0.9) == 1 then
        	log("B服确认")
            tap(GetPoint("B服确认"))
        end
        
		sleep(1000)
        
    end
end

function 从终端到萨米肉鸽()
	
    log("从终端到萨米肉鸽")
	tap(GetPoint("终端"))
	sleep(2000)
	tap(GetPoint("集成战略"))
	sleep(1000)
	tap(GetPoint("萨米肉鸽"))
	sleep(1000)
	tap(GetPoint("进入主题"))
    保证到达肉鸽主界面()
    
end

function 文化比较()
	
    log("开始处理文化比较")
    
    滑动到最左()
    sleep(1000)
    
    for i=1,40 do
        
    	文化比较列表 = pointListMap["文化比较列表"][i]
    	tap(文化比较列表[1],文化比较列表[2])
        sleep(200)
        
        if i == 1 then
        	sleep(200)
        end
        
        tap(GetPoint("文化比较确认升级"))
        sleep(200)
        
        if i == 7 or i == 20 then
        	tap(GetPoint("文化比较向右滑动"))
            sleep(1000)
        end
        
        if i == 33 then
        	滑动到最右()
            sleep(1000)
        end
    end
    
    log("文化比较处理完毕")
    
end

function 处理难度选择()
    
    log("开始处理难度选择")
    if cmpColorEx(GetColor("难度选择确认"),0.9) == 1 then
    	
        while true do
        	
            if cmpColorEx(GetColor("难度选择挑战自然"),0.9) ~= 1 then
            	tap(GetPoint("难度选择下"))
                sleep(100)
            else
            	--5为难度
            	for i=1,5 do
					tap(GetPoint("难度选择上"))
					sleep(700)
                end
                tap(GetPoint("确认难度选择"))
                sleep(1000)
                tap(GetPoint("开始探索"))
                break
            end
            
        end
        
    end
    
    log("难度选择处理完毕")
    
end

function 处理开局初始选项()
	
	log("开始处理开局初始选项")
    sleep(1000)
    
    log("开始选择分队")
    能否找到后勤分队1 = cmpColorEx(GetColor("后勤分队1"),0.9) == 1
    能否找到后勤分队2 = cmpColorEx(GetColor("后勤分队2"),0.9) == 1
    
    while true do
    	
        if cmpColorEx(GetColor("选择支援"),0.9) == 1 or cmpColorEx(GetColor("选择招募组合"),0.9) == 1 then
			log("分队选择完毕")
			break
        elseif 能否找到后勤分队1 then
			tap(GetPoint("第二分队"))
			sleep(300)
		elseif 能否找到后勤分队2 then
			tap(GetPoint("第三分队"))
			sleep(300)
		elseif cmpColorEx(GetColor("选择分队"),0.9) == 1 then
			tap(GetPoint("指挥分队"))
			sleep(300)
        end
        
        sleep(300)
        
    end
    
    log("开始选择招募组合")
    while true do
    	
        if cmpColorEx(GetColor("选择支援"),0.9) == 1 then
        	放弃探索()
            自动肉鸽()
		elseif cmpColorEx(GetColor("选择招募组合"),0.9) == 1 then
			tap(GetPoint("取长补短"))
			sleep(300)
        elseif cmpColorEx(GetColor("初始招募"),0.9) == 1 then
        	log("选择招募组合完毕")
            break
        end
        
        sleep(300)
        
    end
    
    log("开始初始招募")
    
    --因为偶尔会把某个皮肤的山识别成近卫招募券所以添加的，挺屎的
    local 未招募近卫 = true
    local 未招募辅助 = true
    local 未招募医疗 = true
    
	while true do
		
		if cmpColorEx(GetColor("探索冰原"),0.9) == 1 then
			log("初始招募完成，探索冰原")
			sleep(300)
			tap(GetPoint("探索开始"))
			break
		elseif cmpColorEx(GetColor("初始近卫招募券"),0.9) == 1 and 未招募近卫 then
			log("招募干员1")
            sleep(1000)
			tap(GetPoint("初始招募券1"))
			sleep(1000)
			tap(GetPoint("选择助战"))
			sleep(1000)
			招募助战山()
		elseif cmpColorEx(GetColor("初始辅助招募券"),0.9) == 1 and 未招募辅助 then
			log("招募干员2")
            sleep(1000)
			tap(GetPoint("初始招募券2"))
			sleep(1000)
			放弃招募()
		elseif cmpColorEx(GetColor("初始医疗招募券"),0.9) == 1 and 未招募医疗 then
			log("招募干员3")
            sleep(1000)
			tap(GetPoint("初始招募券3"))
			sleep(1000)
			放弃招募()
		elseif cmpColorEx(GetColor("初始先锋招募券"),0.9) == 1 then
        	log("意外选择先手必胜")
            sleep(100)
			放弃探索()
			自动肉鸽()
		end	
        
		sleep(300)
		
    end

end

function 招募助战山()

    while true do
    	
        intX,intY = findMultiColor(123,175,154,1210,"F2F2F2","2|3|313131|10|10|313131|10|0|F2F2F2|13|7|FAFAFA|1|7|FDFDFD|9|14|F7F7F7|0|14|F7F7F7",0,0.9)
        if intX>-1 and intY>-1 then 
        	break
        end
        
        log("更新助战列表")
    	tap(GetPoint("更新助战列表"))
		sleep(1000)
    end

	sleep(1000)

    tap(intX,intY)
	
    sleep(1000)
    
    tap(GetPoint("招募助战"))
    
    sleep(1000)
    
    tap(GetPoint("SKIP"))
    
	sleep(1000)
    
	tap(GetPoint("SKIP"))
    
	sleep(1000)
    
	tap(GetPoint("SKIP"))

end

function 放弃招募()
	
    log("开始放弃招募")
    
    while true do
	    if cmpColorEx(GetColor("确认招募"),0.9) == 1 then
        	
        	tap(GetPoint("确认招募"))
        	
        end
        
	    if cmpColorEx(GetColor("通用红色确认"),0.9) == 1 then
        	
        	tap(GetPoint("确认"))
            return
        	
        end
        
        sleep(500)
    end
end

function 招募任意干员()
	
    tap(GetPoint("第一个干员"))
	sleep(200)
    tap(GetPoint("第二个干员"))
	sleep(200)
    tap(GetPoint("第三个干员"))
	sleep(200)
    tap(GetPoint("第四个干员"))
	sleep(200)
	tap(GetPoint("确认招募"))
    sleep(1000)
	tap(GetPoint("SKIP"))
	sleep(1000)
	tap(GetPoint("SKIP"))
	sleep(1000)
	tap(GetPoint("SKIP"))
    
end

--判断是双节点还是三节点
function 判断第二列节点状态()
	
    if cmpColorEx(GetColor("第二列三节点1"),0.9) == 1 and cmpColorEx(GetColor("第二列三节点2"),0.9) == 1 then
    	return 1
    else
    	return 2
    end
    
end

--判断是双节点还是三节点
function 判断第三列节点状态()
	
    if cmpColorEx(GetColor("第三列三节点1"),0.9) == 1 and cmpColorEx(GetColor("第三列三节点2"),0.9) == 1 then
    	return 1
    else
    	return 2
    end
    
end

function 寻找诡秘的预感()
    
    local intX,intY = findMultiColor(197,1259,578,1282,"FBFBFB","-4|0|FAFAFA|-30|0|FAFAFA|-36|0|FBFBFB|0|2|FFFFFF|-36|2|FFFFFF",0,0.9)
    if intX>-1 and intY>-1 then 
    	log("找到诡秘的预感")
        return intX,intY
    else
	    log("没有找到诡秘的预感")
		return -1,-1
    end
    
end

function 寻找不期而遇1()
	
    滑动到最左()
    sleep(500)
    
    --找的是灰色的不期而遇
    local intX,intY = findMultiColor(131,956,629,1213,"FFFFFF","-3|0|FFFFFF|0|17|FFFFFF|-3|17|FFFFFF|0|44|FFFFFF|-3|44|FFFFFF|0|61|FFFFFF|-3|61|FFFFFF",0,0.9)
    if intX>-1 and intY>-1 then
    	log("找到不期而遇节点")
		return intX,intY
    else
	    log("没有找到不期而遇节点")
		return -1,-1
    end
end

function 寻找不期而遇2()

	--找的是亮起的不期而遇
    local intX,intY = findMultiColor(213,751,559,970,"FFF8BC","3|-35|FFFFFF|3|28|FFFFFF|-12|-7|FFFFF0|11|-3|FFFFF9",0,0.9)
    if intX>-1 and intY>-1 then 
		log("找到不期而遇节点")
		return intX,intY
    else
   		log("没有找到不期而遇节点")
    	return -1,-1
    end
end

function 寻找普通作战节点()

	--找的是亮起的普通作战节点
    local intX,intY = findMultiColor(90,708,639,952,"FFFFFF","32|-1|FFFFFF|14|81|CD6A88",0,0.9)
    if intX == nil or intY == nil then
    	log("没有找到普通作战节点")
		return -1,-1
    end
    
    if intX>-1 and intY>-1 then 
  		log("找到普通作战节点")
    	return intX,intY
    else
		log("没有找到普通作战节点")
    	return -1,-1
    end

end

function 寻找兴致盎然()
	
    local intX,intY = findMultiColor(148,785,636,968,"FFFFE9","-4|12|DCBB77|6|14|D1B174|-58|41|F9F8F2",0,0.9)
    if intX>-1 and intY>-1 then 
    	log("找到兴致盎然节点")
    	return intX,intY
    else
		log("没有找到兴致盎然节点")
    	return -1,-1
    end
    
end

function 寻找得偿所愿节点()
	
    local intX,intY = findMultiColor(203,754,561,970,"677234","-13|47|E0E2D5|-12|65|E3E5DB|-17|94|E7E9E0|56|-39|B5CC70",0,0.9)
    if intX>-1 and intY>-1 then 
    	log("找到得偿所愿节点")
    	return intX,intY
    else
		log("没有找到得偿所愿节点")
    	return -1,-1
    end
    
end

function 处理不期而遇节点()

	log("开始处理不期而遇")
    tap(GetPoint("节点出发前往"))
	sleep(1000)
    
	for i=1,10 do
		
		tap(500,500)
		sleep(300)
        
	end
    
	if cmpColorEx(GetColor("揭下它"),0.9) == 1 then
    	log("揭下它")
    	tap(GetPoint("事件选项1_1"))
        sleep(700)
        tap(GetPoint("事件选项1_1"))
        sleep(1000)
        tap(GetPoint("关闭获得物品面板"))
        sleep(1000)
        tap(500,500)
        sleep(1000)
		tap(500,500)
    elseif cmpColorEx(GetColor("请求生存"),0.9) == 1 then
    	log("请求生存")
        tap(GetPoint("事件选项3_1"))
		sleep(700)
		tap(GetPoint("事件选项3_1"))
		sleep(1000)
		tap(500,500)
		sleep(1000)
		tap(500,500)
    elseif cmpColorEx(GetColor("你迷路了"),0.9) == 1 then
    	log("你迷路了")
        tap(GetPoint("事件选项3_3"))
		sleep(700)
		tap(GetPoint("事件选项3_3"))
		sleep(1000)
		tap(500,500)
		sleep(1000)
		tap(500,500)
    elseif cmpColorEx(GetColor("检查探测器"),0.9) == 1 then
		log("检查探测器")
        tap(GetPoint("事件选项2_1"))
		sleep(700)
		tap(GetPoint("事件选项2_1"))
		sleep(1000)
		tap(500,500)
		sleep(1000)
		tap(500,500)
    elseif cmpColorEx(GetColor("为什么这里满地都是乌萨斯人"),0.9) == 1 then
		log("为什么这里满地都是乌萨斯人")
        tap(GetPoint("事件选项2_1"))
		sleep(700)
		tap(GetPoint("事件选项2_1"))
		sleep(1000)
		tap(500,500)
		sleep(1000)
		tap(500,500)
    elseif cmpColorEx(GetColor("把他的探测器举到他面前"),0.9) == 1 then
		log("把他的探测器举到他面前")
        tap(GetPoint("事件选项2_1"))
		sleep(700)
		tap(GetPoint("事件选项2_1"))
		sleep(1000)
		tap(500,500)
		sleep(1000)
		tap(500,500)
    elseif cmpColorEx(GetColor("和鼷兽玩"),0.9) == 1 then
		log("把他的探测器举到他面前")
        tap(GetPoint("事件选项2_1"))
		sleep(700)
		tap(GetPoint("事件选项2_1"))
		sleep(1000)
		tap(500,500)
		sleep(1000)
		tap(500,500)
    elseif cmpColorEx(GetColor("离开"),0.9) == 1 then
		log("离开")
        tap(GetPoint("事件选项3_3"))
		sleep(700)
		tap(GetPoint("事件选项3_3"))
		sleep(1000)
		tap(500,500)
		sleep(1000)
		tap(500,500)
    elseif cmpColorEx(GetColor("劲爆刺激但是该离开了"),0.9) == 1 then
		log("兴致盎然：劲爆刺激但是该离开了")
        tap(GetPoint("事件选项2_2"))
		sleep(700)
		tap(GetPoint("事件选项2_2"))
		sleep(1000)
		tap(500,500)
		sleep(1000)
		tap(500,500)
    else
    	log("不期而遇错误识别，默认执行不期而遇选项2_1与不期而遇选项2_2")
		tap(GetPoint("事件选项2_1"))
		sleep(700)
		tap(GetPoint("事件选项2_1"))
		sleep(1000)
		tap(GetPoint("事件选项2_2"))
		sleep(700)
		tap(GetPoint("事件选项2_2"))
		sleep(1000)
		tap(500,500)
		sleep(1000)
		tap(500,500)
    end
    
    log("不期而遇处理完毕")
    
end

function 处理作战节点()

	log("开始处理作战节点")
	作战关卡 = 判断作战关卡()
    if 作战关卡 == -1 then
        log("识别作战关卡错误")
        放弃探索()
		自动肉鸽()
        return
    end
    
    作战出发前往()
	sleep(1000)
    判断是否正式进入关卡()
	sleep(1000)
    
    if 作战关卡 == "苔手" then
    	放置干员(1,GetPoint("苔手干员偏差位置"))
		tap(GetPoint("二倍速"))
    	开启技能(GetPoint("苔手干员实际位置"))
    elseif 作战关卡 == "待宰的兽群" then
    	放置干员(1,GetPoint("待宰的兽群干员偏差位置"))
		tap(GetPoint("二倍速"))
		开启技能(GetPoint("待宰的兽群干员实际位置"))
	elseif 作战关卡 == "度假村冤魂" then
    	放置干员(1,GetPoint("度假村冤魂干员偏差位置"))
		tap(GetPoint("二倍速"))
		开启技能(GetPoint("度假村冤魂干员实际位置"))
	elseif 作战关卡 == "死囚之夜" then
    	放置干员(1,GetPoint("死囚之夜干员偏差位置"))
		tap(GetPoint("二倍速"))
		开启技能(GetPoint("死囚之夜干员实际位置"))
    else 
    	log("关卡识别错误2")
    end
    
    while true do
	 
    	if cmpColorEx(GetColor("成功通过"),0.9) == 1 then
        	log("成功通过")
            结算领取奖励()
        	break
        end
        
        if cmpColorEx(GetColor("联系中断"),0.9) == 1 then
        	log("联系中断")
            sleep(100)
			肉鸽结算()
            自动肉鸽()
        end
     
        sleep(1000)
    end

end

function 处理兴致盎然节点()
	
    log("开始处理兴致盎然")
    tap(GetPoint("节点出发前往"))
    
    --实际是保证到达选择页面
	for i=1,10 do
		
		tap(500,500)
		sleep(300)
	 
	end
    
    tap(GetPoint("事件选项2_2"))
    
    sleep(1000)
    
    tap(GetPoint("事件选项2_2"))
    
    log("兴致盎然处理完毕")
    
end

function 处理得偿所愿节点()
	
    log("开始处理得偿所愿")
    tap(GetPoint("节点出发前往"))
    
    --实际是保证到达选择页面
	for i=1,10 do
		
		tap(500,500)
		sleep(300)
	 
	end
    
    tap(GetPoint("事件选项3_1"))
    sleep(1000)
    tap(GetPoint("事件选项3_1"))
    sleep(1000)
    tap(GetPoint("事件选项2_1"))
    sleep(1000)
    tap(GetPoint("事件选项2_1"))
    
	if cmpColorEx(GetColor("确认招募"),0.9) == 1 then
		招募任意干员()
	end
	
    log("兴致盎然处理完毕")
    
end

function 处理商店节点()
	
	log("开始处理诡异行商")
	tap(GetPoint("节点出发前往"))
    sleep(2000)
    
    if not (设置["是否跳过投资"] == "true") then
    	log("开始投资")
		tap(GetPoint("前瞻性投资系统"))
        sleep(1000)
		tap(GetPoint("投资入口"))
		sleep(1000)
        tap(GetPoint("前瞻性投资系统"))
		sleep(1000)
        
		for i=1,10 do
    	    tap(GetPoint("确认购买"))
            if cmpColorEx(GetColor("投资受限"),0.9) == 1 then
            	log("投资受限")
				tap(GetPoint("离开商店"))
            	sleep(1000)
            	tap(GetPoint("离开商店"))
            	sleep(1000)
            	break
            end
			sleep(700)
        end
    end

	for n=1,6 do
		tap(GetPoint("商店货物"..tostring(n)))
		sleep(1000)
		tap(GetPoint("确认购买"))
		sleep(1000)
		if cmpColorEx(GetColor("确认招募"),0.9) == 1 then
			招募任意干员()
		end
		if cmpColorEx(GetColor("源石锭不足"),0.9) == 1 then
			log("源石锭不足")
			break
		end
	end
    
	离开商店()
	log("诡异行商处理完毕")
end

function 判断节点上中下(X)
	local 上 = 520
	local 中 = 395
	local 下 = 275
    
    if X == nil or X == -1 then
    	return -1
    end
    
    if X>中 then
    	return 0
    elseif X<中 and X>下 then
    	return 1
	elseif  X<下 then
    	return 2
    end
end

function 判断作战关卡()
	
	log("开始判断作战关卡")
	if cmpColorEx(GetColor("苔手"),0.9) == 1 then
    	log("苔手")
    	return "苔手"
    elseif cmpColorEx(GetColor("待宰的兽群"),0.9) == 1 then
    	log("待宰的兽群")
    	return "待宰的兽群"
    elseif cmpColorEx(GetColor("度假村冤魂"),0.9) == 1 then
    	log("度假村冤魂")
        return "度假村冤魂"
	elseif cmpColorEx(GetColor("死囚之夜"),0.9) == 1 then
    	log("死囚之夜")
        return "死囚之夜"
	else log("作战关卡识别错误") return -1
    end
	
end

function 判断初始节点可选度()
	
	if cmpColorEx(GetColor("初始双节点1"),0.9) == 1 then
  		tap(GetPoint("初始节点1")) 
    	log("初始节点1为双节点")
	elseif cmpColorEx(GetColor("初始双节点2"),0.9) == 1 then
    	tap(GetPoint("初始节点2")) 
    	log("初始节点2为双节点")
	elseif cmpColorEx(GetColor("初始三节点1"),0.9) == 1 then
    	tap(GetPoint("初始节点1")) 
    	log("初始节点1为双节点")
	elseif cmpColorEx(GetColor("初始三节点2"),0.9) == 1 then
    	tap(GetPoint("初始节点2")) 
    	log("初始节点2为双节点")
	else 
    	tap(GetPoint("初始节点2")) 
        log("选择默认节点2")
	end
	
end

function 保证到达肉鸽主界面()
	
    log("保证到达肉鸽主界面")
    
    while true do
		if cmpColorEx(GetColor("文化比较"),0.9) == 1 then
        	log("已到达萨米肉鸽主页面")
			break
		else
			tap(GetPoint("肉鸽返回"))
            sleep(1000)
		end
        
		if cmpColorEx(GetColor("终端"),0.9) == 1 then
			log("意外到达终端")
			从终端到萨米肉鸽()
		end
        
		if cmpColorEx(GetColor("跳过剧情"),0.9) == 1 then
			log("触发剧情，准备跳过")
            tap(GetPoint("跳过剧情"))
            sleep(1000)
            tap(GetPoint("确认跳过剧情"))
            sleep(1000)
		end
        
        sleep(1000)
    end
    
end

function 保证到达肉鸽节点选择页面()
	
	log("确保到达节点选择页面")
    sleep(2000)
    while true do
    	
    	local intX,intY = findMultiColor(672,1078,716,1122,"AED301","13|7|AED302|0|14|AED301",0,0.9)
        if intX>-1 and intY>-1 then 
        	break
        end
        
        if cmpColorEx(GetColor("肉鸽玩法介绍关闭"),0.9) then
        	tap(GetPoint("肉鸽玩法介绍关闭"))
        end
        
        tap(500,500)
        sleep(1000)
    end
    
    log("已到达节点选择页面")
    
end

function 放弃探索()

	log("开始放弃探索")
    
	保证到达肉鸽主界面()
    
    sleep(1000)
    log("放弃本次探索")
	tap(GetPoint("放弃本次探索"))
    sleep(1000)
    tap(GetPoint("确认"))
    sleep(2000)
    
	肉鸽结算()
    
end

function 肉鸽结算()
	
	log("开始结算")
    
	while true do
		
        if cmpColorEx(GetColor("肉鸽结算SKIP"),0.9) == 1 then
        	tap(GetPoint("肉鸽结算SKIP"))
        end
        
		if cmpColorEx(GetColor("文化比较"),0.9) == 1 then
        	log("保险：确认肉鸽结算完成")
        	sleep(1000)
            if cmpColorEx(GetColor("文化比较"),0.9) == 1 then
				log("肉鸽结算完成")
				return
            end
		else
			tap(GetPoint("肉鸽结算确认"))
		end
        
		sleep(1000)
	end
	
end

function 结算领取奖励()
	
	tap(500,500)
    sleep(1000)
    
    while true do
    	
        tap(GetPoint("收下"))
        sleep(1000)
        
        --拿完了
        if cmpColorEx(GetColor("玩法介绍"),0.9) == 1 then
        	log("拿完了")
        	return
        end
        
        --拿到招募券
        if cmpColorEx(GetColor("确认招募"),0.9) == 1 then
        	招募任意干员()
        end
        
        --拿到双密文板
		if cmpColorEx(GetColor("拿到双密文版"),0.9) == 1 then
			tap(GetPoint("作战结算奖励收下1"))
		end
        
    end
	
end

function 滑动到最左()
	
    log("滑动到最左")
    for i=1,3 do
      	touchDown(1,460,100)
      	sleep(50)
      	touchMoveEx(1,460,1000,100)
      	touchUp(1)
        sleep(100)
    end
end

function 滑动到最右()
	
    log("滑动到最右")
    for i=1,3 do
      	touchDown(1,460,1000)
      	sleep(50)
      	touchMoveEx(1,460,500,500)
      	touchUp(1)
        sleep(100)
    end
end

function 离开商店()
	
	log("开始离开商店")   
	tap(GetPoint("离开商店"))
	sleep(1000)
	tap(GetPoint("离开商店"))
	sleep(1000)
	tap(GetPoint("离开商店"))
	sleep(1000)
	tap(GetPoint("离开商店"))
	sleep(1000)
	tap(GetPoint("离开商店"))
	
end

function 识别肉鸽等级()
	
    local handle = createOcr("eng",4)--字库文件需要放入资源文件中
    if handle ~= nil then
    	setWhiteList(handle,"0123456789")
    	local text = ocrText(handle,646,1050,681,1114,"E3DA73|FEF477|DAD076")
    	if text ~= nil then
    		return text
        else
        	log("等级识别失败")
            return -1
    	end
    	releaseOcr(handle)
    else
    	log("handle加载失败")
        return -1
    end
    
end

function 识别源石锭数量()

	local handle = createOcr("eng",4)--字库文件需要放入资源文件中
    if handle ~= nil then
    	setWhiteList(handle,"0123456789")
    	local text = ocrTextEx(handle,162,170,180,221)
    	if text ~= nil then
    		return text
        else
        	log("源石锭数量识别失败")
    	end
    	releaseOcr(handle)
    else
    	log("handle加载失败")
        return -1
    end
    
end

function 判断是否达到目标()
	
    if 设置["等级目标"] ~= nil then
    	当前等级 = 识别肉鸽等级()
        if 当前等级 ~= nil then
        	
            log("当前等级："..tostring(当前等级))
            if tonumber(当前等级) >= tonumber(设置["等级目标"]) then
            	log("已经达到目标等级，检测是否设置刷取源石锭")
            else
            	log("未到达目标等级，继续任务")
                return
            end
        else
        	log("肉鸽等级识别失败")
            return
        end
    else
    	log("未设置等级具体目标数值，继续任务")
	end
	
    if 设置["等级目标"] ~= nil then
    	if not (设置["是否跳过投资"] == "true") then
    		log("检测到设置刷取源石锭，检测源石锭是否已达到目标")
    		当前源石锭数量 = 识别源石锭数量()
    		if 当前源石锭数量 ~= nil then
    			if tonumber(当前源石锭数量) >= tonumber(设置["源石锭目标"]) then
    				log("已到达目标源石锭等级")
    			else
    				log("未达到目标源石锭等级，继续任务")
    				return
    			end
    		else
    			log("源石锭数量识别失败")
    			return
    		end
    	else
    		log("未检测到设置刷取源石锭，关闭脚本")
        end
    else
    	log("未设置源石锭具体目标数值，继续任务")
    end
    
	if 设置["服务器渠道"] == "0" then
		stopApp(GetChannel("官服"))
	elseif 设置["服务器渠道"] == "1" then
		stopApp(GetChannel("B服"))
	else
		log("意外的输入")
	end
	
    console.show()
	exitScript()
    
end

function log(str)

	print(str)
    console.println(1,getNetWorkTime().."："..tostring(str))
	
end