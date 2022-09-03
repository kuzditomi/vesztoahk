#Include %A_LineFile%\..\..\..\lib\PaddleOcr\PaddleOCR\PaddleOCR.ahk

class ScreenBase {
    ActivateBlueStack() {
        IfWinExist BlueStacks
            WinActivate
    }

    HasTextInRect(textToFind, boundaries) {
        this.ActivateBlueStack()

        title := PaddleOCR(boundaries)
        return InStr(title, textToFind)
    }
}