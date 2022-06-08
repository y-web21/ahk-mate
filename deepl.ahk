#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

SysGet, monitor1, Monitor, 1
; MsgBox, %monitor1Left%, %monitor1Top%, %monitor1Right%, %monitor1Bottom%

; OnClipboardChange("watchClipboardState")
OnClipboardChange:
    ClipBoardDataType=%A_EventInfo%
    tooltopClipboard()
Return

#F1:: Return

; RWin & F2::
; LWin & F2::
LCtrl & F1::
    ClipSaved := ClipboardAll
    Send,^c
    Sleep, 100
    If (Strlen(ClipBoard)>0){
        If GetKeyState("Alt", "P"){
            Run, "https://www.google.co.jp/search?hl=ja&q=%ClipBoard%"
        }Else if GetKeyState("Shift", "P"){
            Run, "https://www.bing.com/search?q=%ClipBoard%"
        } else {
            If (RegExMatch(Clipboard, "^https?://")) {
                Run, "https://translate.google.com/translate?hl=ja&sl=en&u=%ClipBoard%"
            }else{
                Run, "https://www.deepl.com/ja/translator#en/ja/%ClipBoard%"
            }
        }
    }
    Clipboard := ClipSaved
    ClipSaved =
Return

LCtrl & F2::
    if GetKeyState("LWin", "P"){
        InputBox, OutputVar, Translate for DeepL
            if Strlen(OutputVar)>0
            MsgBox, aaa
        Run, "https://www.deepl.com/ja/translator#en/ja/%OutputVar%"
    }Else If GetKeyState("Alt", "P"){
        InputBox, OutputVar, Search for Google
            if Strlen(OutputVar)>0
            Run, "https://www.google.co.jp/search?hl=ja&q=%OutputVar%"
    }Else if GetKeyState("Shift", "P"){
        InputBox, OutputVar, Translate Website for Google
            if Strlen(OutputVar)>0
            Run, "https://translate.google.com/translate?hl=ja&sl=en&u=%OutputVar%"
    }Else{
        ; buf1 := Strlen(ClipBOard)
        ; msgbox,textlen = %buf1%
        If (Strlen(ClipBoard)>0 and RegExMatch(Clipboard, "^https?://")) {
            Run, "https://translate.google.com/translate?hl=ja&sl=en&u=%Clipboard%"
        }Else{
            InputBox, OutputVar, Translate for DeepL
                if Strlen(OutputVar)>0
                Run, "https://www.deepl.com/ja/translator#en/ja/%OutputVar%"
        }
    }
Return

RCtrl & F3::
    if GetKeyState("Ctrl", "P"){
        InputBox, OutputVar, Translate for Google
            if Strlen(OutputVar)>0
            Run, "https://translate.google.com/?hl=ja#en/ja/%OutputVar%"
    }Else If GetKeyState("Alt", "P"){
        InputBox, OutputVar, Search for Google
            if Strlen(OutputVar)>0
            Run, "https://www.google.co.jp/search?hl=ja&q=%OutputVar%"
    }Else if GetKeyState("Shift", "P"){
        InputBox, OutputVar, Translate Website for Google
            if Strlen(OutputVar)>0
            Run, "https://translate.google.com/translate?hl=ja&sl=en&u=%OutputVar%"
    }Else{
        ; buf1 := Strlen(ClipBOard)
        ; msgbox,textlen = %buf1%
        if (%ClipBoardDataType% = %A_EVT_INF_TEXT% and Strlen(ClipBoard)>0) {
            Run, "https://translate.google.com/?hl=ja#en/ja/%Clipboard%"
        }Else{
            InputBox, OutputVar, Translate for Google
                if Strlen(OutputVar)>0
                Run, "https://translate.google.com/?hl=ja#en/ja/%OutputVar%"
        }
    }
Return

RCtrl & F4::
    toggleWatchClipboard()
Return

toggleWatchClipboard(){
    static state := True
    state := !state
    if (state == True){
        OnClipboardChange("tooltopClipboard", 0)
        ToolTip
    } else {
        OnClipboardChange("tooltopClipboard", 1)
    }
}

tooltopClipboard(){
    global monitor1Right
    global monitor1Bottom
    moji := SubStr(Clipboard, 1, 500)
    ToolTip, %moji%, monitor1Right - 250 , monitor1Bottom - 50
}

~Esc::ToolTip

openWithBrowserOrExplorer(){
    If (RegExMatch(Clipboard, "^https?://")) {
        Run, %Clipboard%
    }else If (RegExMatch(Clipboard, ":")) {
        Run, %Clipboard%, , UseErrorLevel
        If (ErrorLevel != 0) {
            ; Run, Explorer.exe
            ; openMyComputer()
        }
    }
return
}
