#Include %A_LineFile%\..\..\debugGui.ahk

CoordMode, ToolTip, Screen
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

class ScreenBase {
    WriteDebug(message) {
        DebugGui.Write(message)
    }

    ActivateBlueStack() {
        IfWinExist BlueStacks
            WinActivate
            
        ; A bal oldali fekete savba lehet batran kattintgatni
        Click, 5, 45
    }

    IsPixelColor(x,y,color) {
        this.ActivateBlueStack()
        PixelGetColor, c, % x, % y
        return c == color
    }

    Esc() {
        this.ActivateBlueStack()
        Send, { esc }
    }
}