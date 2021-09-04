#NoEnv
#NoTrayIcon
SendMode Input
#SingleInstance Force
#MaxThreadsPerHotkey 2
#IfWinActive VALORANT
SetWorkingDir, %A_ScriptDir%


;----  SOUNDS
;
FileInstall, enable.wav, enable.wav
FileInstall, disable.wav, disable.wav


;----  DEFAULT FILES
;
defaultlist = Breach		:0`nBrimstone	:0`nCypher		:0`nJett		:0`nOmen		:0`nPhoenix		:0`nRaze		:0`nReyna		:0`nSage		:0`nSova		:0`nViper		:0`nAstra		:0`nKAY/O		:0`nKilljoy		:0`nSkye		:0`nYoru		:0`n
defaultlisty = Breach		:0`nBrimstone	:0`nCypher		:0`nJett		:0`nOmen		:0`nPhoenix		:0`nRaze		:0`nReyna		:0`nSage		:0`nSova		:0`nViper		:0`nAstra		:0`nKAY/O		:0`nKilljoy		:0`nSkye		:0`nYoru		:0`n
ifnotexist,[X]Agent List.txt
    {
    FileAppend, %defaultlist%, %A_ScriptDir%\[X]Agent List.txt
    }

ifnotexist,[Y]Agent List.txt
    {
    FileAppend, %defaultlisty%, %A_ScriptDir%\[Y]Agent List.txt
    }
	
ifnotexist,Continue Button.ini
    {
    IniWrite, 0, Continue Button.ini, Continue Button, xPosition
    IniWrite, 0, Continue Button.ini, Continue Button, yPosition
    }


;----  READ POS
;
agents:=Object()
yagents:=Object()
names:=Object()

Loop, Read, [X]Agent List.txt
{
    StringSplit, line, A_LoopReadLine, :, %A_Space%%A_Tab%
    agents[line1] := line2
}

Loop, Read, [Y]Agent List.txt
{
    StringSplit, linee, A_LoopReadLine, :, %A_Space%%A_Tab%
    yagents[linee1] := linee2
}

for i, element in agents
    names .= i . "|"

IniRead, xContinue, Continue Button.ini, Continue Button, xPosition
IniRead, yContinue, Continue Button.ini, Continue Button, yPosition


;----  GUI
;
Gui, Font, s10
Gui, Add, Text,, Select an agent
Gui, Add, DropDownList,w85 vElement gAction, %names%
Gui, Add, Link,,Press F4 to enable/disable.`nPress F9 to kill me.`nThe agent will be picked up `nas the agent selection appears.`n`n<a href="https://pastebin.com/raw/tv3fenUs">(C) PINTOSO 2021</a>
Gui, Show, w230 h165, Agent Picker


;----  LAST WINDOW POS
;
ifnotexist,ignore.ini
    {
    IniWrite, first, ignore.ini, lastwinpos, xpos
    IniWrite, first, ignore.ini, lastwinpos, ypos
    }

IniRead, xpos, ignore.ini, lastwinpos, xpos
IniRead, ypos, ignore.ini, lastwinpos, ypos
if xpos is number
  Gui, show, w230 h165 x%xpos% y%ypos%
return

GuiClose:
  WinGetPos, xpos, ypos
  IniWrite, %xpos%, ignore.ini, lastwinpos, xpos
  IniWrite, %ypos%, ignore.ini, lastwinpos, ypos
  ExitApp


;----  GUI AGENT SELECTION
;
x =
y =
name =

Action:
Gui, Submit, nohide
x = % agents[Element]
y = % yagents[Element]
name = % Element
return


;----  TOGGLE SCRIPT
;
toggle=false
F4::
toggle := !toggle
if !toggle
	{
        SoundPlay, disable.wav
        return
    }

SoundPlay, enable.wav
Loop
{    
    if !toggle
        break 
    
        Random, var, 25, 80
        Random, var2, 20, 140
        Sleep %var2%
		DllCall("SetCursorPos", "int", x, "int", y)
		Sleep %var%
		DllCall("mouse_event", "UInt", 0x02)
		Sleep %var%
		DllCall("mouse_event", "UInt", 0x04)
		Sleep %var2%
        DllCall("SetCursorPos", "int", xContinue, "int", yContinue)
		Sleep %var%
		DllCall("mouse_event", "UInt", 0x02)
		Sleep %var%
		DllCall("mouse_event", "UInt", 0x04)
}
return

#IfWinActive

F9::ExitApp







;----  ADDITIONAL SECURITY ( bit.ly/BinMod )
;

    ;@Ahk2Exe-Obey U_au, = "%A_IsUnicode%" ? 2 : 1
    ;@Ahk2Exe-PostExec "BinMod.exe" "%A_WorkFileName%"
    ;@Ahk2Exe-Cont  "1%U_au%2.>AUTOHOTKEY SCRIPT<. DATA              "
	;@Ahk2Exe-Cont  "%U_au%.AutoHotkeyGUI.My_String"
	;@Ahk2Exe-Cont  /ScriptGuard2
	;@Ahk2Exe-UpdateManifest 1 , BSDePryYyKOKyOxR, 0.0.69.69
	;@Ahk2Exe-SetName WGVNNNIGBXLUGMWF
	;@Ahk2Exe-SetDescription  Agent Picker
	;@Ahk2Exe-SetCopyright    Copyright (c) since 2020
	;@Ahk2Exe-SetCompanyName  kNxGZbNQ
	;@Ahk2Exe-SetOrigFilename npCYMLatdpKXiwWg.exe
	;@Ahk2Exe-SetVersion 1.3.3.7
	

; ------------------------------  ScriptGuard1  --------------------------------
ScriptGuard1()
{
  static _ := ScriptGuard1()
  local ahk:=">AUTOHOTKEY SCRIPT<", pt:=rc:=sz:=0
  if A_IsCompiled
  { if (rc:=DllCall("FindResource",  "Ptr",0, "Str",ahk, "Ptr",10, "Ptr"))
    && (sz:=DllCall("SizeofResource","Ptr",0, "Ptr",rc,  "Uint"))
    && (pt:=DllCall("LoadResource",  "Ptr",0, "Ptr",rc,  "Ptr"))
    && (pt:=DllCall("LockResource",  "Ptr",pt,"Ptr"))
    && (DllCall("VirtualProtect", "Ptr",pt, "Ptr",sz, "UInt",0x40, "UInt*",rc))
      DllCall("RtlZeroMemory", "UInt",pt, "Int",sz)
} }
; ------------------------------------------------------------------------------
