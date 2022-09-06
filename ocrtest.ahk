#SingleInstance, Force

#Include lib\PaddleOcr\PaddleOCR\PaddleOCR.ahk
#Include src\screens\screenBase.ahk

textToSearch := "Failed"
rect := [614, 750, 165,60]

hastext := ScreenBase.HasTextInRect(textToSearch, rect)

If hastext
    MsgBox siker!
Else
    ocr := PaddleOCR(rect)
    MsgBox, Nem talaltam: %textToSearch%! Ezt latom: %ocr%