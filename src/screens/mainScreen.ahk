#Include %A_LineFile%\..\screenBase.ahk

class MainScreen extends ScreenBase {
    Play() {
        base.ActivateBlueStack()

        MouseGetPos, xpos, ypos
        click 1615, 940 ;play gomb
    }

    CloseOffer() {
        If base.HasTextInRect("OFFER", [850, 125, 190, 50])  
            click 1417, 225
        sleep 600
         If base.HasTextInRect("YES", [718, 710, 190, 50])  
         click 718, 710 
    }


    CloseFail() {
        If base.HasTextInRect("FAILED", [680, 250, 130,50])
            send {esc}
    }

    CloseContractProgress() {
        If base.HasTextInRect("CONTRACTS", [730, 60, 225, 60])
            click 1755, 95
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

    DontSave() 
    {
        If base.HasTextInRect("DONTS", [614, 750, 165,60])
            click 614, 750
    }    
    CloseRank() 
    {
        If base.HasTextInRect("Leagues", [850, 327, 300, 60])
        sleep 500
             click 1735,550 ;manage rank change
    }    
    CloseOffer3() {
        If base.HasTextInRect("EPIC", [780, 185, 190, 100])
            click 1417, 225
        sleep 600
         If base.HasTextInRect("YES", [718, 710, 190, 50])  
         click 718, 710 
    }      

    CloseOffer4() {
        If base.HasTextInRect("HUF", [989, 736, 190, 100]) 
          click 1417, 225
        sleep 600
         If base.HasTextInRect("YES", [718, 710, 190, 50]) 
         click 718, 710 
    }    

    

    ClosePopupsAfterMatch() {
        this.CloseFail()
        this.CloseOffer()
        this.CloseContractProgress()
        this.CloseLeaguesAdvance()
        this.DeclineInvite()
        this.CloseOffer2()
        this.CloseRank()
        this.CloseOffer3()
        this.CloseOffer4()
    }

    CollectWinChest() {
        click 320, 996 ;battle chest
        sleep 1800
        loop 13
        {
            sleep 500
            click 320, 996 ;battle chest
        }
    }     
}