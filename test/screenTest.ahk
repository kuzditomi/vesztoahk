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
        PixelGetColor, actualPixelColor, % x, % y
        MouseMove, % x, % y 
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
 TestImage("images\w11_ingame", 1482, 483, 0xe4c99c)
 
 ;sabotage_ingame && !base.IsPixelColor(1482, 483, 0xdfc499) && !base.IsPixelColor(1482, 483, 0xDec379)

; Valódi játék képernyő pixel szín keresés
; TestGameScreen(850, 450, 0x8f6c02)

; Ellenőrzi hogy ugyanaz a játékképernyő és a képen lévő szín a pozíción
; TestMatchingColorPositionWithImageAndGameScreen("images\winstreak.png", 700, 450, 0x00b0f8)

ExitApp