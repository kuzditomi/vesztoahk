#Include %A_LineFile%\..\..\..\lib\PaddleOcr\PaddleOCR\PaddleOCR.ahk

class ScreenBase {
    HasTextInRect(textToFind, boundaries) {
        IfWinExist BlueStacks App Player
            WinActivate
        title := PaddleOCR(boundaries)
        return InStr(title, textToFind)
    }
}