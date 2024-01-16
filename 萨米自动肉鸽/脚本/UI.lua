local show = true
local 设置
local ui设置保存读取路径 = getWorkPath().."/settings.txt"

function 创建并显示UI()

	ui.newLayout("mainUI",800,500)
    ui.setTitleText("mainUI","萨米自动肉鸽")
    
    ui.addTabView("mainUI","mainView")
    ui.setOnClose("mainUI","开始()")
    
    --主功能的UI
    ui.addTab ("mainView", "主功能", "主功能")
    ui.addTextView("主功能","文字框1","服务器渠道")
    ui.addSpinner("主功能","服务器渠道",{"官服","B服"})
    ui.newRow("主功能","row1")
    
    --设置的UI
    ui.addTab ("mainView", "设置", "设置")
    ui.addTextView("设置","文字框","等级目标")
    ui.addEditText("设置","等级目标","50")
    ui.addTextView("设置","文字框","源石锭目标")
    ui.addEditText("设置","源石锭目标","999")
    ui.newRow("设置","row1")
    ui.addTextView("设置","文字框","重启时间（s）")
    ui.addEditText("设置","重启时间","1800")
	ui.newRow("设置","row2")
    ui.addCheckBox("设置","是否跳过投资","跳过投资",false)
    ui.addCheckBox("设置","是否自动点天赋","自动点天赋",true)
    
    --其他的UI
    ui.addTab ("mainView", "其他", "其他")
    
    ui.show("mainUI")
    ui.loadProfile(ui设置保存读取路径)
    
    while true do
    	
        if show then
        	sleep(200)
        else
        	return 设置
        end
    end
    
end

function 开始()
	设置 = ui.getData()
	show = false
    ui.saveProfile(ui设置保存读取路径)
end
