#Include %A_LineFile%\..\screenBase.ahk

class MainScreen extends ScreenBase {
    Play() {
        base.ActivateBlueStack()
        
        MouseGetPos, xpos, ypos
        click 1615, 940 ;play gomb
    }

    CloseOffer() {
        If base.HasTextInRect("OFFER", [850, 125, 190, 50])
            send {esc}
    }

    CloseFail() {
        If base.HasTextInRect("FAILED", [680,250, 130,50])
            send {esc}
    }

    ClosePopupsAfterMatch() {
        this.CloseFail()
        this.CloseOffer()
    }
}