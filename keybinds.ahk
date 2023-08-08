#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
SetTitleMatchMode 2

; ~F2::Run, "%A_ScriptFullPath%"
~F2::Reload
; ~F3::Suspend
; ~F4::Pause

; (title) (ahk_class xx) (ahk_exe yy)
GroupAdd, GroupEditorE, ahk_exe notepad++.exe
GroupAdd, GroupEditorE, Text ahk_class Chrome_WidgetWin_1
GroupAdd, GroupEditorE, ahk_class Notepad
GroupAdd, GroupEditorE, ahk_exe WinMergeU.exe

#If WinActive("ahk_group GroupEditorE")
    Ctrl & l::
    If (GetKeyState("Shift", "P")){
        Send, +{End}+{Down}
    }Else{
        Send, {Home}+{End}
    }
Return
Ctrl & u::Send, +{Home 2}{delete}
Ctrl & k::
    If (GetKeyState("Shift", "P")){
        Send, {Home 2}+{End}{Delete 2}
    }Else{
        Send, +{End}{delete}
    }
Return
; Ctrl & a::Send, {Home}
; Ctrl & e::Send, {End}
LAlt & b::Send, ^{Left}
LAlt & f::Send, ^{Right}
Ctrl & w::Send, ^{Right}^+{Left}
#If


; henkan key
>^space::Send,{vk1Csc079}
; RCtrl::Send,{vk1Csc079}
