探索次数 = 0
升级天赋树探索计数 = 0

function 自动肉鸽()
	
    判断是否达到目标()
	log("开始自动肉鸽")
    探索次数 = 探索次数 + 1 
	log("当前探索次数："..tostring(探索次数))
    
    sleep(1000)
    
	while true do
    	
    	if cmpColorEx(GetColor("等待科考队重建"),0.9) == 1 then
        	sleep(1000)
        elseif cmpColorEx(GetColor("放弃本次探索"),0.9) == 1 then
        	放弃探索()
        elseif cmpColorEx(GetColor("驻足于"),0.9) == 1 then
        	tap(GetPoint("开始探索"))
            sleep(1000)
            肉鸽结算()
        else
        	break
        end
    	
    end
    
    if 设置["是否自动点天赋"] == "true" then
    	
        升级天赋树探索计数 = 升级天赋树探索计数 + 1
        
        if 升级天赋树探索计数 >= 10 then
        	log("判断是否需要升级天赋树")
        	升级天赋树探索计数 = 0
            
            if cmpColorEx(GetColor("研究完成"),0.9) == 1 then
            	log("研究完成，无需升级天赋树")
            else
        		tap(GetPoint("文化比较"))
            	sleep(1000)
        		文化比较()
                保证到达肉鸽主界面()
            end
        end
    end
    
    log("开始探索")
	tap(GetPoint("开始探索"))
    sleep(1000)
    处理难度选择()
    sleep(1000)
    处理开局初始选项()
	sleep(1000)
    保证到达肉鸽节点选择页面()
    sleep(1000)
    
    不期而遇x,不期而遇y = 寻找不期而遇1()
    sleep(1000)
    index1 = 判断节点上中下(不期而遇x)
    if index1 == 0 then
   		tap(GetPoint("初始节点1"))
    elseif index1 == 1 then
    	log("不期而遇在中间")
		判断初始节点可选度()
	elseif index1 == 2 then
		tap(GetPoint("初始节点2"))
	elseif index1 == -1 then
    	log("没有找到不期而遇")
    	放弃探索()
        sleep(1000)
        自动肉鸽()
    end
    
    sleep(2000)
    处理作战节点()
    sleep(1000)
    滑动到最左()
	sleep(1000)
    tap(不期而遇x,不期而遇y)
    log(tostring(不期而遇x)..":"..tostring(不期而遇y))
	sleep(1000)
    tap(GetPoint("节点出发前往"))
	sleep(1000)
    处理不期而遇节点() 
    
	保证到达肉鸽节点选择页面()
    sleep(4000)
	不期而遇x2,不期而遇y2 = 寻找不期而遇2()
    if 不期而遇x2>-1 and 不期而遇y2>-1 then
    	tap(不期而遇x2,不期而遇y2)
        sleep(2000)
        处理不期而遇节点()
    else
    	得偿所愿x,得偿所愿y = 寻找得偿所愿节点()
    	if 得偿所愿x>-1 and 得偿所愿y>-1 then
        	tap(得偿所愿x,得偿所愿y)
            sleep(2000)
            处理得偿所愿节点()
        else
    		兴致盎然x,兴致盎然y = 寻找兴致盎然()
    		if 兴致盎然x>-1 and 兴致盎然y>-1 then
				tap(兴致盎然x,兴致盎然y)
				sleep(2000)
				处理兴致盎然节点()
			else
        		普通作战节点x,普通作战节点y = 寻找普通作战节点()
        		if 普通作战节点x>-1 and 普通作战节点y>-1 then
        			tap(普通作战节点x,普通作战节点y)
        	    	sleep(2000)
        	    	处理作战节点()
        		else
					放弃探索()
                	自动肉鸽()
        		end
            end
        end
    end
    
	保证到达肉鸽节点选择页面()
    
    tap(GetPoint("诡异行商节点1"))
	sleep(1000)
	tap(GetPoint("诡异行商节点2"))
	sleep(1000)
	tap(GetPoint("节点出发前往"))
	sleep(1000)
	处理商店节点(设置["是否跳过投资"])
	sleep(1000)
	保证到达肉鸽节点选择页面()
	sleep(1000)
	放弃探索()
	自动肉鸽()
    
end

function 重启脚本()
	
    log("重启脚本")
    
	setTimer(重启脚本,设置["重启时间"] * 1000)
	
    if 设置["服务器渠道"] == "0" then
		重启官服登录至主页()
    elseif 设置["服务器渠道"] == "1" then
		重启B服登录至主页()
    else
    	log("意外的输入")
    end
	
    sleep(1000)
	从终端到萨米肉鸽()
    sleep(1000)
    自动肉鸽()
    
end

function 开启脚本()

	setTimer(重启脚本,设置["重启时间"] * 1000)
    console.show(false)
    console.dismiss()
    
    if 设置["服务器渠道"] == "0" then
		官服登录至主页()
    elseif 设置["服务器渠道"] == "1" then
		B服登录至主页()
    else
    	log("意外的输入")
    end
	
    sleep(1000)
	从终端到萨米肉鸽()
    sleep(1000)
    自动肉鸽()
end

----------------------------
--开启脚本()
----------------------------

