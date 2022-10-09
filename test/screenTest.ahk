#SingleInstance, Force
#Warn, All

#Include ..\src\screens\screenBase.ahk
#Include ..\src\screens\gameScreen.ahk
#Include ..\src\screens\mainScreen.ahk

CoordMode, ToolTip, Screen
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

TestImage(imagePath, x, y, pixelColor)
{
    Gui, +ToolWindow 
    Gui, Add, Picture, , % imagePath 
    Gui, Show, x-13 y-32

    isPixelColorExpected := ScreenBase.IsPixelColor(x,y,pixelColor)

    if(!isPixelColorExpected){
        newX := ScreenBase.ScaleX(x)
        newY := ScreenBase.ScaleY(y)

        PixelGetColor, actualPixelColor, % newX, % newY
        MouseMove, % newX, % newY 
        MsgBox, Valami nemjo a %imagePath% teszttel. valodi szin: %actualPixelColor%
    }

    Gui, Destroy
}

TestGameScreen(x, y, pixelColor)
{
    ScreenBase.ActivateBlueStack()
    isPixelColorExpected := ScreenBase.IsPixelColor(x,y,pixelColor)

    if(!isPixelColorExpected){
        PixelGetColor, actualPixelColor, % x, % y
        MouseMove, % x, % y 
        MsgBox, Valami nemjo a kepernyo teszttel. valodi szin: %actualPixelColor%
    }

    Gui, Destroy
}

TestMatchingColorPositionWithImageAndGameScreen(imagePath, x, y, pixelColor) {
    ScreenBase.ActivateBlueStack()
    PixelGetColor, gameScreenPixelColor, % x, % y

    Gui, +ToolWindow 
    Gui, Add, Picture, , % imagePath 
    Gui, Show, x-13 y-32

    PixelGetColor, imagePixelColor, % x, % y

    if(gameScreenPixelColor == imagePixelColor){
        MsgBox, Megegyezik a szin! %imagePixelColor%
    } else {
        MsgBox, Kulonboznek! Jatek kepernyon: %gameScreenPixelColor% Kepen: %imagePixelColor%
    }
}

; ; Kép pixel szín keresés
 TestImage("images\kiskepernyo.png", 662, 986, 0xC87700)

; base.IsPixelColor(610, 750, 0x2147ED) && base.IsPixelColor(700, 450, 0x00b0f8)

; Valódi játék képernyő pixel szín keresés
; TestGameScreen(850, 450, 0x8f6c02)

; Ellenőrzi hogy ugyanaz a játékképernyő és a képen lévő szín a pozíción
; TestMatchingColorPositionWithImageAndGameScreen("images\winstreak.png", 700, 450, 0x00b0f8)

ExitApp