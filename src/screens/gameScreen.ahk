#Include %A_LineFile%\..\screenBase.ahk

class GameScreen extends ScreenBase {
    Result() {
        sleep 3000
        
        click 235, 956

        sleep 2500
        
        ; Ez bezárja a winstreak ablakot is, nem kell DeclineWinstreak !!!
        this.Esc()
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
