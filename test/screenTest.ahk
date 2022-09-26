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
        MsgBox, Kulonboynek! Jatek kepernyon: %gameScreenPixelColor% Kepen: %imagePixelColor%
    }
}

; ; Kép pixel szín keresés
 TestImage("images\failed2.png", 1240, 265, 0x944204)

; base.IsPixelColor(610, 750, 0x2147ED) && base.IsPixelColor(700, 450, 0x00b0f8)

; Valódi játék képernyő pixel szín keresés
; TestGameScreen( 490, 985, 0x3D0317)

; Ellenőrzi hogy ugyanaz a játékképernyő és a képen lévő szín a pozíción
; TestMatchingColorPositionWithImageAndGameScreen("images\main.png", 490, 985, 0x3D0317)

ExitApp