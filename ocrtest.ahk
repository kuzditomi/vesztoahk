#SingleInstance, Force

#Include lib\PaddleOcr\PaddleOCR\PaddleOCR.ahk
#Include src\screens\screenBase.ahk

textToSearch := "epic"
rect := [917, 413, 190, 100]

hastext := ScreenBase.HasTextInRect(textToSearch, rect)

If hastext 
    MsgBox siker
Else {
    ocr := PaddleOCR(rect)
    MsgBox, Nem talaltam: %textToSearch%! Ezt latom: %ocr%
}