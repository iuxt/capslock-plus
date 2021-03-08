; keys functions start-------------
; 所有按键对应功能都放在这，为防止从set.ini通过按键设置调用到非按键功能函数，
; 规定函数以"keyFunc_"开头

keyFunc_doNothing(){
    return
}

keyFunc_send(p){
    sendinput, % p
    return
}

keyFunc_run(p){
    run, % p
    return
}

keyFunc_toggleCapsLock(){
    SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"
    return
}

keyFunc_moveLeft(i:=1){
    SendInput, {left %i%}
    return
}


keyFunc_moveRight(i:=1){
    SendInput, {right %i%}
    Return
}


keyFunc_moveUp(i:=1){
    global
    if(WinActive("ahk_id" . GuiHwnd))
    {
        ControlFocus, , ahk_id %LV_show_Hwnd%
        SendInput, {Up %i%}
        ControlFocus, , ahk_id %editHwnd%
    }
    else
        SendInput,{up %i%}
    Return
}


keyFunc_moveDown(i:=1){
    global
    if(WinActive("ahk_id" . GuiHwnd))
    {
        ControlFocus, , ahk_id %LV_show_Hwnd%
        SendInput, {Down %i%}
        ControlFocus, , ahk_id %editHwnd%
    }
    else
        SendInput,{down %i%}
    Return
}


keyFunc_moveWordLeft(i:=1){
    SendInput,^{Left %i%}
    Return
}


keyFunc_moveWordRight(i:=1){
    SendInput,^{Right %i%}
    Return
}


keyFunc_backspace(){
    SendInput,{backspace}
    Return
}


keyFunc_delete(){
    SendInput,{delete}
    Return
}

keyFunc_deleteAll(){
    SendInput, ^{a}{delete}
    Return
}

keyFunc_deleteWord(){
    SendInput, +^{left}
    SendInput, {delete}
    Return
}


keyFunc_forwardDeleteWord(){
    SendInput, +^{right}
    SendInput, {delete}
    Return
}


keyFunc_translate(){
    global
    selText:=getSelText()
    if(selText)
    { 
        ydTranslate(selText)
    }
    else
    { 
        ClipboardOld:=ClipboardAll
        Clipboard:=""
        SendInput, ^{Left}^+{Right}^{insert}
        ClipWait, 0.05
        selText:=Clipboard
        ydTranslate(selText)
        Clipboard:=ClipboardOld
    }
    SetTimer, setTransGuiActive, -400
    Return
}


keyFunc_end(){
    SendInput,{End}
    Return
}


keyFunc_home(){
    SendInput,{Home}
    Return
}


keyFunc_moveToPageBeginning(){
    SendInput, ^{Home}
    Return
}


keyFunc_moveToPageEnd(){
    SendInput, ^{End}
    Return
}

keyFunc_deleteLine(){
    SendInput,{End}+{home}{bs}
    Return
}

keyFunc_deleteToLineBeginning(){
    SendInput,+{Home}{bs}
    Return
}

keyFunc_deleteToLineEnd(){
    SendInput,+{End}{bs}
    Return
}

keyFunc_deleteToPageBeginning(){
    SendInput,+^{Home}{bs}
    Return
}

keyFunc_deleteToPageEnd(){
    SendInput,+^{End}{bs}
    Return
}

keyFunc_enterWherever(){
    SendInput,{End}{Enter}
    Return
}

keyFunc_esc(){
    SendInput, {Esc}
    Return
}

keyFunc_enter(){
    SendInput, {Enter}
    Return
}

;双字符
keyFunc_doubleChar(char1,char2:=""){
    if(char2=="")
    {
        char2:=char1
    }
    charLen:=StrLen(char2)
    selText:=getSelText()
    ClipboardOld:=ClipboardAll
    if(selText)
    {
        Clipboard:=char1 . selText . char2
        SendInput, +{insert}
    }
    else
    {
        Clipboard:=char1 . char2
        SendInput, +{insert}{left %charLen%}
    }
    Sleep, 100
    Clipboard:=ClipboardOld
    Return
}

keyFunc_sendChar(char){
    ClipboardOld:=ClipboardAll
    Clipboard:=char
    SendInput, +{insert}
    Sleep, 50
    Clipboard:=ClipboardOld
    return
}


keyFunc_pageUp(){
    global
    if(WinActive("ahk_id" . GuiHwnd))
    {
        ControlFocus, , ahk_id %LV_show_Hwnd%
        SendInput, {PgUp}
        ControlFocus, , ahk_id %editHwnd%
    }
    else
        SendInput, {PgUp}
    return
}


keyFunc_pageDown(){
    global
    if(WinActive("ahk_id" . GuiHwnd))
    {
        ControlFocus, , ahk_id %LV_show_Hwnd%
        SendInput, {PgDn}
        ControlFocus, , ahk_id %editHwnd%
    }
    else
        SendInput, {PgDn}
    Return
}

;页面向上移动一页，光标不动
keyFunc_pageMoveUp(){
    SendInput, ^{PgUp}
    return
}

;页面向下移动一页，光标不动
keyFunc_pageMoveDown(){
    SendInput, ^{PgDn}
    return
}

keyFunc_pasteSystem(){
    global

    ; ;
    ; 禁止 OnClipboardChange 运行，防止 Clipboard:=sClipboardAll 重复执行，导致偶尔会粘贴出空白
    ;  if(!CLsets.global.allowClipboard)  ;禁用剪贴板功能
    ;  {
    ;      CapsLock2:=""
    ;      return
    ;  }
    if (whichClipboardNow!=0)
    {
        allowRunOnClipboardChange:=false
        Clipboard:=sClipboardAll
        whichClipboardNow:=0
    }
    SendInput, ^{v}
    return
}


keyFunc_cut(){
    global
    SendInput, ^{x}
    Return
}


keyFunc_copy(){
    global
    SendInput, ^{insert}
    Return
}


keyFunc_paste(){
    global
    SendInput, +{insert}
    Return
}

keyFunc_undo(){
    global
    SendInput, ^{z}
    Return
}


keyFunc_tabPrve(){
    SendInput, ^+{tab}
    return
}


keyFunc_tabNext(){
    SendInput, ^{tab}
    return
}


keyFunc_jumpPageTop(){
    SendInput, ^{Home}
    return
}


keyFunc_jumpPageBottom(){
    SendInput, ^{End}
    return
}


keyFunc_selectUp(i:=1){
    SendInput, +{Up %i%}
    return
}


keyFunc_selectDown(i:=1){
    SendInput, +{Down %i%}
    return
}


keyFunc_selectLeft(i:=1){
    SendInput, +{Left %i%}
    return
}


keyFunc_selectRight(i:=1){
    SendInput, +{Right %i%}
    return
}


keyFunc_selectHome(){
    SendInput, +{Home}
    return
}


keyFunc_selectEnd(){
    SendInput, +{End}
    return
}

keyFunc_selectToPageBeginning(){
    SendInput, +^{Home}
    return
}


keyFunc_selectToPageEnd(){
    SendInput, +^{End}
    return
}


keyFunc_selectCurrentWord(){
    SendInput, ^{Left}
    SendInput, +^{Right}
    return
}


keyFunc_selectCurrentLine(){
    SendInput, {Home}
    SendInput, +{End}
    return
}


keyFunc_selectWordLeft(i:=1){
    SendInput, +^{Left %i%}
    return
}


keyFunc_selectWordRight(i:=1){
    SendInput, +^{Right %i%}
    return
}

;页面移动一行，光标不动
keyFunc_pageMoveLineUp(i:=1){
    SendInput, ^{Up %i%}
    return
}


keyFunc_pageMoveLineDown(i:=1){
    SendInput, ^{Down %i%}
    return
}


keyFunc_mediaPrev(){
    SendInput, {Media_Prev}
    return
}


keyFunc_mediaNext(){
    SendInput, {Media_Next}
    return
}


keyFunc_mediaPlayPause(){
    SendInput, {Media_Play_Pause}
    return
}


keyFunc_volumeUp(){
    SendInput, {Volume_Up}
    return
}


keyFunc_volumeDown(){
    SendInput, {Volume_Down}
    return
}


keyFunc_volumeMute(){
    SendInput, {Volume_Mute}
    return
}


keyFunc_reload(){
    MsgBox, , , reload, 0.5
    Reload
    return
}


;winbind-------------
keyFunc_winbind_activate(n){
    global
    activateWinAction(n)
    return
}


keyFunc_winbind_binding(n){
    global
    if(tapTimes[n]=="")
        initWinsInfos(n)
    tapTimes(n)
    return
}


keyFunc_winPin(){
    _id:=WinExist("A")
    ;  WinGet, ExStyle, ExStyle
    ;  if (ExStyle & 0x8)
    ;  {
    ;      WinSet, AlwaysOnTop, Off
    ;      WinSet, Transparent, Off
    ;    
    ;      return
    ;  }
    WinSet, AlwaysOnTop
    ;  WinSet, Transparent, 210
    return
}

 
;keys functions end-------------
; testing arer ---

keyFunc_activateSideWin(UDLR){
    activateSideWin(UDLR)
}

keyFunc_putWinToBottom(){
    putWinToBottom()
}

keyFunc_winJumpIgnore(){
    winJumpIgnore()
}

keyFunc_clearWinMinimizeStach(){
    clearWinMinimizeStach()
}

keyFunc_popWinMinimizeStack(){
    popWinMinimizeStack()
}

keyFunc_pushWinMinimizeStack(){
    pushWinMinimizeStack()
}

keyFunc_unshiftWinMinimizeStack(){
    unshiftWinMinimizeStack()
}

keyFunc_winTransparent(){
    winTransparent()
}