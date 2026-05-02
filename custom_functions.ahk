; 自定义的函数写在这个文件里,  然后能在 MyKeymap 中调用

; 使用如下写法，来加载当前目录下的其他 AutoHotKey v2 脚本
; #Include ../data/test.ahk

sendSomeChinese() {
	Send("{text}你好中文!")
}

alt_tab_id := 'Alt-Tab Terminator - [Guid("DD574C71-05FD-43AA-8503-2D81B87437AE")]'
altTab() {
	Send("{LWin down}{\}{LWin up}")
	if ( not WinExist(alt_tab_id)) {
		SetTimer () => __altTab(), -100
	}
}

__altTab() {
	if (WinExist(alt_tab_id)) {
		WinActivate(alt_tab_id)
	}
}
; 显示桌面
showDock() {
	Send("#d")
}

winTab() {
	Send("{LWin down}{Tab}{LWin up}")
}


WindowTitle := 'Bluetooth Audio Receiver'
hideWindow() {
	hWnd := WinExist(WindowTitle)
	if !hWnd {
		MsgBox "未找到窗口！"
		return
	}
	; 隐藏窗口
	WinHide "ahk_id " hWnd
	; 修改窗口样式，移除任务栏图标
	WinSetStyle("-0x80000", "ahk_id " hWnd)  ; 移除 WS_EX_APPWINDOW 样式
	; 显示窗口
	WinShow "ahk_id " hWnd
}

; shift + 刷新
refresh() {
	Send("{F5}")
}

win_p() {
	Send("#p")
	; SetTimer(__win_p, -8000)
}

__win_p() {
	Run 'E:\各种各样的安装包\软件合集\按键映射\shortcuts\TranslucentTB.lnk'
}

exclude_list_2 := Map(
	"javaw.exe", true
	)


win_e() {
	current_window:= WinGetProcessName("A")
    if (exclude_list_2.Has(current_window)) {
		Send("!e")
    } else {
		Send("^#z")
		KeyWait("e")
    }
}

shift_alt_e() {
	current_window:= WinGetProcessName("A")
    if (exclude_list_2.Has(current_window)) {
		Send("+!e")

    } else {
		Send("^#x")
		KeyWait("e")
    }
}



toast() {
	TrayTip('你好中文', 'Hello World')
}

pixpin_cmd := (
	"E:\PixPin\PixPin.exe "
	"-r "
	"state=pixpin.isDisableShortcuts();"
	"if (state) {"
		"pixpin.disableShortcuts(!state);"
		"pixpin.runSystem('ahk-toast.exe open')"
	"}else {"
		"pixpin.disableShortcuts(!state);"
		"pixpin.runSystem('ahk-toast.exe close')"
	"}"
)


pix_pin_toggle() {
	Run pixpin_cmd
}


; 调出Quiker防止手贱长按导致鬼畜
+!0:: {
	; 调用函数
	Send('+!0')
	; 等待按键松开
	KeyWait("0")
	return
}

eudic_state := '已关闭划词翻译'
; 显示开启或关闭欧陆词典
!F1:: {
	global eudic_state
	if (eudic_state == '已开启划词翻译') {
		eudic_state := '已关闭划词翻译'
	} else {
		eudic_state := '已开启划词翻译'
	}
	ToolTip (eudic_state)
	SetTimer () => ToolTip(), -2000
	Send("!{F1}")
	KeyWait("F1")
	return
}

Win_T() {
	value := !(WinGetExStyle("A") & 0x8)
	Run 'quicker:runaction:a180d729-d9a1-4aae-a267-64b4fb6aa789?keyboard'
	if value {
		SetTimer () => ToolTip("窗口已顶置"), -400
		SetTimer () => ToolTip(), -1500
	} else {
		ToolTip("已取消置顶")
		SetTimer () => ToolTip(), -1500
	}
}
; F1查找单词,映射ctrl+F12
; F1:: {
; 	Send("{Ctrl Down}")
; 	Send("{F12}")
; 	Sleep 50
; 	Send("{Ctrl Up}")
; 	KeyWait("F1")
; 	return
; }
exclude_list := Map(
	"webstorm64.exe", true,
	"javaw.exe", true
	)
search_dict() {
	current_window:= WinGetProcessName("A")

    ; 检查是否包含 "WebStorm" 字样
    if (exclude_list.Has(current_window)) {
        ; WebStorm 在前台，不执行函数
		Send("{F1}")

    } else {
        ; WebStorm 不在前台，执行函数
		Send("{Ctrl Down}")
		Send("{F12}")
		Sleep 100
		Send("{Ctrl Up}")
		KeyWait("F1")
    }
	
	return
}

toggle_touch_mouse() {
	Send '{LWin Down}{LCtrl Down}{F24}{LCtrl Up}{LWin Up}'
}

openWitchVSCode() {
	Run("quicker:runaction:7cd83361-7d44-4de9-a7f9-bee09b37c4af")
}