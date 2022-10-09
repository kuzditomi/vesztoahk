#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\stalkerCharacter.ahk

CoordMode, ToolTip, Screen
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

class TestScript extends ScriptBase {
    __New() {
        this.character := new StalkerCharacter()
    }

    GetIntroductionText() {
        return this.character.GetIntroductionText("AFK")
    }

    Run() {
        this.WriteDebug("Fut az test program")

        if WinExist("BlueStacks"){
            WinActivate
            WinMove, BlueStacks,, 0, 0, 960,540
        }

        Sleep 5000

        ; this.screens.main.Click(400,400)

    }
}
