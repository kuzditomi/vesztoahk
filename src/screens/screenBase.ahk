#Include %A_LineFile%\..\..\debugGui.ahk
#Include %A_LineFile%\..\..\baseClass.ahk

class ScreenBase extends MyBaseClass {
    WriteDebug(message) {
        DebugGui.Write(message)
    }

    ActivateBlueStack() {
        if WinExist("BlueStacks"){
            WinActivate

            ; A bal oldali fekete savba lehet batran kattintgatni
            Click, 400, 39
        }
    }

    IsPixelColor(x,y,color) {
        ; this.ActivateBlueStack()

        newX := this.ScaleX(x)
        newY := this.ScaleY(y)

        PixelGetColor, c, %newX%, %newY%

        return c == color
    }

    Esc() {
        this.ActivateBlueStack()
        Send, { esc }
    }
}