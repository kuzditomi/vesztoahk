#Include %A_LineFile%\..\screenBase.ahk

class MainScreen extends ScreenBase {
    Play() {
        base.ActivateBlueStack()

        click 1615, 940
    }

    CanPlay() {
        ; Ha nagyon zöld a PLAY gomb
        return base.IsPixelColor(1750, 950, 0x09C563)
    }

    CloseByESC() {
        ; CloseBattlePalsOffer - Sötétkék X körül és egy darab az egyik betűbúl fehér
        if (base.IsPixelColor(1420, 260 , 0x7F2330) && base.IsPixelColor(901, 205 , 0xFFEBF4)) 
        ||
         ;close offer az X közepe sötétkék
        base.IsPixelColor(1364, 232, 0x944204)
        ||
        ; Fail - az X közepe sötétkék
        base.IsPixelColor(1240, 265, 0x944204)
        ||
        ; Contract felirat szine turkiz es az x kozepe vilagoskek
        (base.IsPixelColor(1025, 90 , 0xFFe400) && base.IsPixelColor(1765, 90, 0xed8c0a))
        ||
        ; League advance - Popup felül nagyon kék alul sötét kék
        (base.IsPixelColor(1350, 365, 0xEC8C0A) && base.IsPixelColor(1350, 800, 0x784709))
        ||
        ; decline invite -  Piros gomb és a serleg aranybarna
        (base.IsPixelColor(681, 655, 0x2247ED) && base.IsPixelColor(1270, 500, 0x076ee4))
        ||
        ; Dont save - Piros gomb és arany medál
        (base.IsPixelColor(610, 750, 0x2147ED) && base.IsPixelColor(700, 450, 0x00b0f8))
        ||
        ;Outfit offer - a gomb zöld
        base.IsPixelColor(1344, 805 , 0x09c462)
        {
            base.Esc()
        }
       
    }

    ClickToClose(){
     ; offer után - piros YES
        if (base.IsPixelColor(865, 760 , 0x1C42EA))
        {
            click 718, 710 
        }
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

        If base.HasTextInRect("YES", [718, 710, 190, 50]) {
            click 718, 710 
        }
    }

    CloseFail() {
        ;If base.HasTextInRect("FAILED", [680, 250, 130,50]) 
        ;az X közepe sötétkék
        if base.IsPixelColor(1240, 265, 0x944204){
            base.Esc()
        }
    }

    CloseContractProgress() {
        ; If base.HasTextInRect("CONTRACTS", [730, 60, 225, 60])
        ; Contract felirat szine turkiz es az x kozepe vilagoskek
        if(base.IsPixelColor(1025, 90 , 0xFFe400) && base.IsPixelColor(1765, 90, 0xed8c0a)){
            click 1755, 95
        }
    }

    CloseLeaguesAdvance() {
        ; Popup felül nagyon kék alul sötét kék
        if(base.IsPixelColor(1350, 365, 0xEC8C0A) && base.IsPixelColor(1350, 800, 0x784709)){
            this.Esc()
        }
    }

    DeclineInvite() {
        ; if base.HasTextInRect("INVITE", [888, 325, 150,60]) 
        ; Piros gomb és a serleg aranybarna
        if (base.IsPixelColor(681, 655, 0x2247ED) && base.IsPixelColor(1270, 500, 0x076ee4)){
            click 780, 695
        }
    }

    CloseOffer2() {
        If base.HasTextInRect("OFFER", [836, 131, 80,50]) {
            click 1417, 225
        }
    } 

    DontSave() 
    {
        ; If base.HasTextInRect("DONTS", [614, 750, 165,60]) {
        ; Piros gomb és arany medál
        if (base.IsPixelColor(610, 750, 0x2147ED) && base.IsPixelColor(700, 450, 0x00b0f8)){
            click 614, 750
        }
    } 

    CloseOffer3() {
        If base.HasTextInRect("EPIC", [780, 185, 190, 100]){
            click 1417, 225
        }

        sleep 600

        If base.HasTextInRect("YES", [718, 710, 190, 50]) {
            click 718, 710 
        }
    } 

    CloseOffer4() {
        If base.HasTextInRect("HUF", [989, 736, 190, 100]) {
            click 1417, 225
        }

        sleep 600

        If base.HasTextInRect("YES", [718, 710, 190, 50]) {
            click 718, 710 
        }
    } 

    CloseOfferOutfit() {
        ;a gomb zöld
        if base.IsPixelColor(1344, 805 , 0x09c462) {
            ; If base.HasTextInRect("OFFER", [850, 125, 190, 50]) {
            click 1420, 230
            sleep 600
        }

        If base.HasTextInRect("YES", [718, 710, 190, 50]) {
            click 718, 710 
        }
    }

    ClosePopupsAfterMatch() {
        sleep 1500
        while(!this.CanPlay()){
           /* this.CloseByESC()
            if(this.CanPlay()) {
                return
            }
 
            this.ClickToClose()
            if(this.CanPlay()) {
                return
            }   
         */
            this.CloseFail()
            if(this.CanPlay()) {
                return
            }

            this.CloseBattlePalsOffer()
            if(this.CanPlay()) {
                return
            }

            this.CloseContractProgress()
            if(this.CanPlay()) {
                return
            }

            this.CloseOffer()
            this.CloseOffer2()
            this.CloseOffer3()
            this.CloseOffer4()
            this.CloseLeaguesAdvance()
            this.DeclineInvite()
            this.CloseOfferOutfit()
            this.DontSave()
        

            sleep 50
        }        
    }

    CollectWinChest() {
        ; Sárga a ládától jobbra
        if (base.IsPixelColor(485, 920, 0x27ABFE)){
            click 320, 920 ;battle chest bal lent
            sleep 1800
            this.Esc()
        }
    } 
}
