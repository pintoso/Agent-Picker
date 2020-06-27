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
defaultlist = Breach	:0`nCypher	:0`nJett	:0`nPhoenix	:0`nSage	:0`nSova	:0`nViper	:0`nBrimstone	:0`nOmen	:0`nRaze	:0`nReyna	:0`n
ifnotexist,Agent List.txt
    {
    FileAppend, %defaultlist%, %A_ScriptDir%\Agent List.txt
    }
	
ifnotexist,Config.ini
    {
    IniWrite, 0, Config.ini, Agents Icons, yPosition
    IniWrite, 0, Config.ini, Continue Button, xPosition
    IniWrite, 0, Config.ini, Continue Button, yPosition
    }


;----  READ POS
;
agents:=Object()
names:=Object()

Loop, Read, Agent List.txt
{
    StringSplit, line, A_LoopReadLine, :, %A_Space%%A_Tab%
    agents[line1] := line2
}

for i, element in agents
    names .= i . "|"

IniRead, y, Config.ini, Agents Icons, yPosition
IniRead, xContinue, Config.ini, Continue Button, xPosition
IniRead, yContinue, Config.ini, Continue Button, yPosition


;----  GUI
;
Gui, Font, s10
Gui, Add, Text,, Select an agent
Gui, Add, DropDownList,w85 vElement gAction, %names%
Gui, Add, Link,,Press F4 to enable/disable.`nPress F9 to kill me.`nThe agent will be picked up `nas the agent selection appears.`n`n<a href="https://pastebin.com/raw/tv3fenUs">(C) PINTOSO 2020</a>
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
    
        Sleep, 51
        MouseClick, left, x, y
        Sleep, 51
        MouseClick, left, xContinue, yContinue
}
return

#IfWinActive

F9::ExitApp
