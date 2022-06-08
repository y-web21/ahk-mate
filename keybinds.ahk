#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
SetTitleMatchMode 2

; (title) (ahk_class xx) (ahk_exe yy)
GroupAdd, GroupEditorE, ahk_exe notepad++.exe
GroupAdd, GroupEditorE, Text ahk_class Chrome_WidgetWin_1

#If WinActive("ahk_group GroupEditorE")
    ctrl & l::Send, {home}+{end}
    ctrl & u::Send, +{home}{delete}
    ctrl & k::Send, +{end}{delete}
    ctrl & e::Send, {end}
    ctrl & a::Send, {home}
    ctrl & w::Send, ^{right}^+{left}
#If
