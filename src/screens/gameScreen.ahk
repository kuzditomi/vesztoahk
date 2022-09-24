#Include %A_LineFile%\..\screenBase.ahk

class GameScreen extends ScreenBase {
    IsResultVisible() {
        ; Bal lent kék háttérű gomb és fehér szöveg benne
        return (base.IsPixelColor(135, 950, 0xEB950F) && base.IsPixelColor(260, 955, 0xFFFFFF))
    }

    Result() { 
        click 235, 956
        sleep 2500

        ; Ez bezárja a winstreak ablakot is, nem kell DeclineWinstreak !!!
        this.Esc()
    }

    IsDontSaveVisible() {
        ; Dont save - Piros gomb és arany medál
        return (base.IsPixelColor(610, 750, 0x2147ED) && base.IsPixelColor(700, 450, 0x00b0f8))
    }

    CanCollect() {
        ; zöld collect gomb
        return base.IsPixelColor(800, 900, 0x13CA6C)
    }

    WaitForGameStart() {
        this.WriteDebug("Varom a kovetkezo kort!")

        While !base.IsPixelColor(661, 985, 0xC87700) {
            sleep 500
        }

        this.WriteDebug("Indul a visszaszamlalas...")

        ; Visszaszámlálás 5től meg még 2-3mp töltés
        sleep 9000
    }

    IsSabotageCharacterChoosing() {
        return base.IsPixelColor(661, 985, 0xC87700)
    }

    WaitForSabotageStart() {
        this.WriteDebug("Varom hogy kezdodjon a sabotage")
        
        While (!this.IsSabotageCharacterChoosing()) {
            sleep 500
        }

        this.WriteDebug("Indul a visszaszamlalas...")
        ; Visszaszámlálás 11től meg még 2-3mp töltés
        sleep 15000
    }

    DeclineWinstreak() {
        sleep 3000
        if (base.IsPixelColor(880, 780, 0x1C43EA)) {
            ; Ez egész a főképernyőre visszadob elvileg nem kell Collect
            this.Esc() 
        }
    }
}
