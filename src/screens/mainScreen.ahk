#Include %A_LineFile%\..\screenBase.ahk
#Include %A_LineFile%\..\..\statistics.ahk

class MainScreen extends ScreenBase {
    Play() {
        base.ActivateBlueStack()

        click 1615, 940
    }

    CanPlay() {
        ; Ha nagyon zöld a PLAY gomb
        return base.IsPixelColor(1750, 950, 0x09C563)
    }

    CloseBattlePalsOffer() {
        ; Sötétkék X körül és egy darab az egyik betűbúl fehér
        if (base.IsPixelColor(1420, 260 , 0x7F2330) && base.IsPixelColor(1046, 236 , 0xFFEBF4)) {
            base.Esc()

            sleep 500

            ; piros YES
            if(base.IsPixelColor(865, 760 , 0x1C42EA)){
                click 865, 760
            }
        }
    }

    CloseOffer() {
        ;az X közepe sötétkék
        if base.IsPixelColor(1364, 232, 0x944204) {
            ; If base.HasTextInRect("OFFER", [850, 125, 190, 50]) {
            click 1417, 225
            sleep 600
        }

        this.CloseDeclineOffer()
    }

    IsFailVisible() {
        return base.IsPixelColor(1240, 265, 0x944204)
    }

    CloseFail() {
        ;If base.HasTextInRect("FAILED", [680, 250, 130,50]) 
        ;az X közepe sötétkék
        if (this.IsFailVisible()){
            this.WriteDebug("Close Fail")
            click 1240, 265
        }
    }

    CloseContractProgress() {
        ; If base.HasTextInRect("CONTRACTS", [730, 60, 225, 60])
        ; Contract felirat szine turkiz es az x kozepe vilagoskek
        if(base.IsPixelColor(1025, 90 , 0xFFe400) && base.IsPixelColor(1765, 90, 0xed8c0a)){
            this.WriteDebug("Close Contract progress")
            click 1755, 95
        }
    }

    CloseLeaguesAdvance() {
        ; Popup felül nagyon kék alul sötét kék
        if(base.IsPixelColor(1350, 365, 0xEC8C0A) && base.IsPixelColor(1350, 800, 0x784709)){
            this.WriteDebug("Close League advance")
            click 1710, 550
        }
    }

    DeclineInvite() {
        ; if base.HasTextInRect("INVITE", [888, 325, 150,60]) 
        ; Piros gomb és a serleg aranybarna
        if (base.IsPixelColor(681, 655, 0x2247ED) && base.IsPixelColor(1270, 500, 0x076ee4)){
            this.WriteDebug("Decline Invite")
            click 780, 695
        }
    }

    DontSave() 
    {
        ; If base.HasTextInRect("DONTS", [614, 750, 165,60]) {
        ; Piros gomb és arany medál
        if (base.IsPixelColor(610, 750, 0x2147ED) && base.IsPixelColor(1050, 450, 0x8f6c02)){
            this.WriteDebug("Dontsave")
            click 614, 750
        }
    } 

    CloseOfferOutfit() {
        ;a gomb zöld
        if base.IsPixelColor(1344, 805 , 0x09c462) {
            this.WriteDebug("Close Outfit Offer")
            ; If base.HasTextInRect("OFFER", [850, 125, 190, 50]) {
            click 1420, 230
            sleep 600
        
            this.CloseDeclineOffer()
        }
    }

    CloseDeclineOffer(){
        if (base.IsPixelColor( 700, 750, 0x1F45EC) && base.IsPixelColor( 783, 730, 0xFFFFFF)) {
            this.WriteDebug("Close Decline Offer")
            click 718, 710 
        }
    }

    CloseCollect(){
        if base.IsPixelColor(800, 900, 0x13CA6C) {
            this.WriteDebug("CloseCollect")
            click 800, 900 
        }
    }

    CloseResult(){
        if (base.IsPixelColor(135, 950, 0xEB950F) && base.IsPixelColor(260, 955, 0xFFFFFF)) {
            this.WriteDebug("Close result")
            click 235, 956 
        }
    }

    ClosePopupsAfterMatch() {
        sleep 1500
        this.WriteDebug("Elkezdek minden szart bezarni")

        while(!this.CanPlay()){
            this.WriteDebug("Ujra zarok")
            this.CloseFail()
            this.CloseBattlePalsOffer()
            this.CloseContractProgress()
            this.CloseOffer()
            this.CloseOfferOutfit()
            this.CloseLeaguesAdvance()
            this.DeclineInvite()
            this.DontSave()
            this.CloseResult()
            this.CloseCollect()

            sleep 500
        } 
    }

    CollectChests() {
        this.WriteDebug("Osszeszedem a ladakat")

        this.CollectWinChest()
        this.CollectKillChest()
    }

    CollectWinChest() {
        ; Sárga a ládától jobbra
        if (base.IsPixelColor(485, 920, 0x27ABFE)){
            Statistics.CollectedWinChest()
            click 320, 920 ;battle chest bal lent
            sleep 1800
                loop 13
                {
                sleep 500
                click 320, 996
                }
            sleep 1300
            ; ClosContract progress - Contract felirat szine turkiz es az x kozepe vilagoskek
            if (base.IsPixelColor(1025, 90 , 0xFFe400) && base.IsPixelColor(1765, 90, 0xed8c0a))
           click 1755, 95
        }

    } 

    CollectKillChest() {
        ; Sárga a ládától jobbra
        if (base.IsPixelColor(700, 925 , 0x27ABFE)){
            Statistics.CollectedKillChest()

            click 700, 925 ;Kill chest bal lent
            sleep 1800
                loop 13
                {
                sleep 500
                click 700, 925
                }
            sleep 1300
            ; ClosContract progress - Contract felirat szine turkiz es az x kozepe vilagoskek
            if (base.IsPixelColor(1025, 90 , 0xFFe400) && base.IsPixelColor(1765, 90, 0xed8c0a))
                this.Esc()
        }
    } 
}
