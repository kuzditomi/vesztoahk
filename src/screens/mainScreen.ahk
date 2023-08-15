#Include %A_LineFile%\..\screenBase.ahk
#Include %A_LineFile%\..\..\statistics.ahk

class MainScreen extends ScreenBase {
    Play() {
        base.ActivateBlueStack()

        click 1615, 940
    }

    CanPlay() {
        ; Ha nagyon zöld a PLAY gomb
        return (base.IsPixelColor(1750, 950, 0x09C563) || base.IsPixelColor(1750, 950, 0x08c462) || base.IsPixelColor(1450, 950, 0x10c969))
    }

    CloseBattlePalsOffer() {
        ; Sötétkék X körül és egy darab az egyik betűbúl fehér
        if (base.IsPixelColor(1420, 260 , 0x7F2330) && base.IsPixelColor(1420, 225 , 0xFFFFFF)) {
            click 1420, 225

            sleep 600

            this.CloseDeclineOffer()
        }
    }

    CloseSabotage() {
        ;az X közepe sötétkék
        if base.IsPixelColor(1388, 252, 0x944204) {
            click 1388, 252
        }
    }
    CloseOffer() {
        ;az X közepe sötétkék
        if base.IsPixelColor(1364, 232, 0x944204) {
            click 1364, 232
            sleep 600

            this.CloseDeclineOffer()
        }
    }

    CloseOffer2() {
        ;az X közepe fehér
        if base.IsPixelColor(1414, 222, 0xffffff) {
            click 1414, 222
            sleep 600

            this.CloseDeclineOffer()
        }
    }

    IsFailVisible() {
        ;az X közepe sötétkék
        return base.IsPixelColor(1240, 265, 0x944204)
    }

    CloseFail() {
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
        if (base.IsPixelColor(681, 655, 0x2247ED) ){ ;&& base.IsPixelColor(1270, 500, 0x076ee4)
            this.WriteDebug("Decline Invite")
            click 780, 695
        }
    }

    CloseStreakDontSave() {
        ; Piros gomb és arany medál
        if ((base.IsPixelColor(610, 750, 0x2147ED) || base.IsPixelColor(610, 750, 0x2146ED)) && base.IsPixelColor(1050, 450, 0x8f6c02)){
            this.WriteDebug("CloseStreakDontSave ")
            click 614, 750
        }
    }

    CloseOfferOutfit() {
        ;a gomb zöld
        if base.IsPixelColor(1344, 805 , 0x09c462) {
            this.WriteDebug("Close Outfit Offer")
            click 1420, 230
            sleep 600

            this.CloseDeclineOffer()
        }
    }

    CloseDeclineOffer(){
        if ((base.IsPixelColor( 700, 750, 0x1F45EC) || base.IsPixelColor( 700, 750, 0x1F44eb)) && base.IsPixelColor( 783, 730, 0xFFFFFF)) {
            this.WriteDebug("Close Decline Offer")
            click 783, 730
        }
    }

    CloseCollect(){
        if (base.IsPixelColor(800, 900, 0x13CA6C) || base.IsPixelColor(800, 900, 0x11C96A)) {
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

    CloseFun(){
        if (base.IsPixelColor(1320, 327, 0x944204)){
            this.WriteDebug("Close Fun")
            click 1320, 327
        }
    }

    CloseFestival(){
        if (base.IsPixelColor(1340, 220, 0x944204)){
            this.WriteDebug("Close Festival")
            click 1340, 220
        }
    }

    WhenLeague(){
        ; kék felső és zöld gomb
        base.IsPixelColor(1420, 225 , 0x662408) && base.IsPixelColor(1280, 875 , 0x13ca6c)
    }

    CloseLeague(){
        if (this.WhenLeague()){
            this.WriteDebug("Liga fordulo... begyujtom")
            click 1280, 875
            sleep 1000
            loop 4
            {
                click 1780, 675
                sleep 500
            }
        }
    }

    TryToCloseUnknownPopup() {
        ; Eddig ismeretlen ablakra nyomok egy esc-et
        if(this.CanPlay()) {
            return
        }

        this.WriteDebug("Ismeretlen ablak, ESC")
        this.Esc()
        sleep 500

        ; Ha esetleg még decline is kéne, azt is megpróbáljuk
        this.CloseDeclineOffer()
    }

    ClosePopupsAfterMatch() {
        this.WriteDebug("Elkezdek minden szart bezarni")

        loopCounter := 1
        loop {
            sleep 1000
            loopCounter++

            this.WriteDebug("Zarogatok...")
            this.CloseFail()
            this.CloseSabotage()
            this.CloseBattlePalsOffer()
            this.CloseContractProgress()
            this.CloseOffer()
            this.CloseOffer2()
            this.CloseOfferOutfit()
            this.CloseLeaguesAdvance()
            this.DeclineInvite()
            this.CloseStreakDontSave()
            this.CloseResult()
            this.CloseCollect()
            this.CloseFun()
            this.CloseFestival()
            this.CloseLeague()

            if(loopCounter > 2) {
                this.TryToCloseUnknownPopup()
            }

            sleep 500

            if (this.CanPlay()){
                break
            }
        }
    }

    CollectChests() {
        this.WriteDebug("Osszeszedem a ladakat")

        this.CollectWinChest()
        this.CollectKillChest()
    }

    CollectWinChest() {
        ; Sárga a ládától jobbra
        if (base.IsPixelColor(175, 920, 0x27ABFE)){
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
        if (base.IsPixelColor(420, 925 , 0x27ABFE)){
            Statistics.CollectedKillChest()

            click 700, 925 ;Kill chest bal lent
            sleep 1800
            loop 10
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
