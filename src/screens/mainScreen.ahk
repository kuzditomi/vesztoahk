#Include %A_LineFile%\..\screenBase.ahk

class MainScreen extends ScreenBase {
    Play() {
        IfWinExist BlueStacks App Player
            WinActivate

        MouseGetPos, xpos, ypos
        click 1615, 940 ;play gomb
        sleep 25000
    }

    CheckOffer() {
        If base.HasTextInRect("OFFER", [850, 125, 190, 50])
            MsgBox, The string was found.
        Else
            MsgBox, The string was not found.
        ExitApp
    }
}