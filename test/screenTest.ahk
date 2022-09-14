#SingleInstance, Force
#Warn, All

#Include ..\src\screens\screenBase.ahk

TestImage(imagePath, x, y, pixelColor)
{
    Gui, +ToolWindow
    Gui, Add, Picture, , % imagePath 
    Gui, Show, x-13 y-32

    isPixelColorExpected := ScreenBase.IsPixelColor(x,y,pixelColor)

    Gui, Destroy

    if(!isPixelColorExpected){
        MsgBox, Valami nemjo a %imagePath% teszttel
    }

}

TestImage("images\waiting.png", 669, 968, 0x541609)

MsgBox, Vegzett a teszt!

ExitApp