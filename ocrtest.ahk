#SingleInstance, Force

#Include lib\PaddleOcr\PaddleOCR\PaddleOCR.ahk
#Include src\screens\screenBase.ahk

textToSearch := "Failed"
rect := [836, 131, 80,50]

hastext := ScreenBase.HasTextInRect(textToSearch, rect)

If hastext
    MsgBox siker!
Else
    ocr := PaddleOCR(rect)
    MsgBox, Nem talalt! Ezt latom: %ocr%