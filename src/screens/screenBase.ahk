#Include %A_LineFile%\..\..\..\lib\PaddleOcr\PaddleOCR\PaddleOCR.ahk

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
        Tooltip Nyomom az escet
        this.ActivateBlueStack()
        Send, { esc }
    }
}