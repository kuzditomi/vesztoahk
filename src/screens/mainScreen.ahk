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

    DeclineInvite() {
        if base.HasTextInRect("INVITE", [888, 325, 150,60]) 

        click 780, 695
    }

    CloseOffer2() {
        If base.HasTextInRect("OFFER", [836, 131, 80,50])
            click 1417, 225
    }    

    ClosePopupsAfterMatch() {
        this.CloseFail()
        this.CloseOffer()
        this.CloseContractProgress()
        this.CloseLeaguesAdvance()
        this.DeclineInvite()
        this.CloseOffer2()
    }
}