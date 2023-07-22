#Include %A_LineFile%\..\..\debugGui.ahk

CoordMode, ToolTip, Screen
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

class ScreenBase {
    ColorDistance(c1, c2) {
        return Sqrt((((c1>>16)-(c2>>16))**2)+(((c1>>8&255)-(c2>>8&255))**2)+(((c1&255)-(c1&255))**2))
    }

    WriteDebug(message) {
        DebugGui.Write(message)
    }

    ActivateBlueStack() {
        IfWinExist BlueStacks
            WinActivate

        ; A bal oldali fekete savba lehet batran kattintgatni
        ; Click, 5, 45
        Click 1615, 940 ; a ply gombot nyomkodja
    }

    IsPixelColor(x,y,color, distance = 5) {
        this.ActivateBlueStack()
        PixelGetColor, c, % x, % y
        return this.ColorDistance(c,color) < distance
    }

    Esc() {
        this.ActivateBlueStack()
        Send, { esc }
    }
}