; 自定义的函数写在这个文件里,  然后能在 MyKeymap 中调用

; 使用如下写法，来加载当前目录下的其他 AutoHotKey v2 脚本
; #Include ../data/test.ahk

sendSomeChinese() {
  Send("{text}你好中文!")
}

alt_tab_id := 'Alt-Tab Terminator - [Guid("DD574C71-05FD-43AA-8503-2D81B87437AE")]'
altTab() {
  Send("{LWin down}{\}{LWin up}")
  if (not WinExist(alt_tab_id)) {
    SetTimer(__altTab, -100)
  }
}

__altTab() {
    WinActivate(alt_tab_id)
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

win_p(){
  Send("#p")
  SetTimer(__win_p, -8000)
}

__win_p() {
  Run 'C:\Program Files\WindowsApps\28017CharlesMilette.TranslucentTB_2024.3.0.0_x64__v826wp6bftszj\TranslucentTB.exe'
}


toast() {
  TrayTip('你好中文', 'Hello World')
}

pix_pin_toggle() {
  TrayTip('已切换', '截图快捷键开关' )
  Send('+!/')
  SetTimer () => TrayTip(), -2000
}

# 防止手贱长按导致鬼畜
+!0::{
  ; 调用函数
    Send('+!0')
    ; 等待按键松开
    KeyWait("0")
    return
}