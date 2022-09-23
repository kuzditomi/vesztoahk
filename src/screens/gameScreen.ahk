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

    CanCollect() {
        ; zöld collect gomb es feher felirat benne
        return (base.IsPixelColor(800, 900, 0x13CA6C) && base.IsPixelColor(1019, 910 , 0xFFFFFF))
    ||
        ; Dont save - Piros gomb és arany medál
        (base.IsPixelColor(610, 750, 0x2147ED) && base.IsPixelColor(700, 450, 0x00b0f8))
    }

    WaitForGameStart() {
        While !base.IsPixelColor(661, 985, 0xC87700) {
            sleep 500
        }

        ; Visszaszámlálás 5től meg még 2-3mp töltés
        sleep 9000
    }

    DeclineWinstreak() {
        sleep 3000
        if (base.IsPixelColor(880, 780, 0x1C43EA)) {
            ; Ez egész a főképernyőre visszadob elvileg nem kell Collect
            this.Esc() 
        }
    }
}
