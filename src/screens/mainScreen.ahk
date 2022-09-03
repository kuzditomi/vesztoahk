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
        If base.HasTextInRect("FAILED", [680, 250, 130,50])
            send {esc}
    }

    CloseContractProgress() {
        If base.HasTextInRect("CONTRACTS", [730, 60, 225, 60])
            send {esc}
    }

    CloseLeaguesAdvance() {
        If base.HasTextInRect("LEAGUES", [855, 325, 175, 60])
            send {esc}
    }

    ClosePopupsAfterMatch() {
        this.CloseFail()
        this.CloseOffer()
        this.CloseContractProgress()
        this.CloseLeaguesAdvance()
    }
}