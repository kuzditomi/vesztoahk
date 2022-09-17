#Include %A_LineFile%\..\..\..\lib\PaddleOcr\PaddleOCR\PaddleOCR.ahk

CoordMode, ToolTip, Screen
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

class ScreenBase {
    ActivateBlueStack() {
        ; A bal oldali fekete savba lehet batran kattintgatni
        Click, 5, 45
    }

    HasTextInRect(textToFind, boundaries) {
        this.ActivateBlueStack()

        title := PaddleOCR(boundaries)
        return InStr(title, textToFind)
    }

    IsPixelColor(x,y,color) {
        PixelGetColor, c, % x, % y
        return c == color
    }

    Esc() {
        this.ActivateBlueStack()
        Send, { esc }
    }
}