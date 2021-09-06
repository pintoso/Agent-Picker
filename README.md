# VALORANT Agent Picker
Automatically picks a selected agent as soon as possible.

### AutoHotkey is not required to run the executable!
### [DOWNLOAD HERE](https://github.com/pintoso/Agent-Picker/releases/latest/download/AgentPicker.exe)
#### if your antivirus does not like the file, this is a FALSE positive, check the [VIRUSTOTAL](https://www.virustotal.com/gui/file/b16bab869527ccafd8c885928012ffbef102175358ce744e751495029da1ce34/detection) scan


![](https://i.imgur.com/0nYAqMg.png)

Stop crying because someone is playing badly with your main agent

## How to use
1. Download & run executable
2. Run VALORANT
3. Choose a agent via the dropdown

4. Start a queue
5. Press F4 to toggle script
6. Agent selected?
7. Press F4 again
8. Profit

# How to configure for your resolution

[Continue Button.ini](Continue%20Button.ini) = XY Continue Button position

[[X]Agent List.txt]([X]Agent%20List.txt) = X Agents position

[[Y]Agent List.txt]([Y]Agent%20List.txt) = Y Agents position

You can add agents or correct the position of existing ones after an update or for a different resolution.
Simply take a screenshot of the agent selection screen and use pretty much any image editor to acquire a certain icon's coordinates.

Or use [the online method](https://github.com/pintoso/Agent-Picker/issues/2) (very easy)

## Compiling
if you want to compile by yourself for security reasons, follow this step by step to compile correctly in `.exe`

(step 7 and 8 are optional)

1. Install [AHK](https://www.autohotkey.com/download/)

2. Download/clone the [github repository](https://github.com/pintoso/Agent-Picker)

3. Download [Ahk2Exe Beta](https://github.com/AutoHotkey/Ahk2Exe/releases/tag/Ahk2Exe_v1.1.34.00_Beta_1)

4. Install Ahk2Exe Beta following these [instructions](https://www.autohotkey.com/boards/viewtopic.php?f=6&t=65095)

5. Download, compile and install [BinMod.ahk](https://github.com/AutoHotkey/Ahk2Exe/blob/master/BinMod.ahk) (follow the instructions on line 15)

6. Compile `Agent Picker.ahk` using Ahk2Exe using these [settings](https://prnt.sc/1rbyj5u)

7. Download [imageCFG](https://robpol86.com/imagecfg.html) and place it in the same `AgentPicker.exe` folder

8. open CMD in that folder and run `imagecfg -u AgentPicker.exe`


## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)


> > based on the [Overwatch Hero Picker](https://github.com/Robert-K/overwatch-hero-picker/)
