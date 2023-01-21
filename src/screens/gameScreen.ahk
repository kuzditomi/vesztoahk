#Include %A_LineFile%\..\screenBase.ahk

class GameScreen extends ScreenBase {
    IsResultVisible() {
        ; Bal lent kék háttérű gomb és fehér szöveg benne
        return ((base.IsPixelColor(135, 950, 0xEB950F) && base.IsPixelColor(260, 955, 0xFFFFFF)) || (base.IsPixelColor(135, 950, 0xEA950E) && base.IsPixelColor(260, 955, 0xE9910E)))
    }

    Result() { 
        this.WriteDebug("Resultra nyomok es kilepek")

        click 235, 956
        sleep 2500

        ; Ez bezárja a winstreak ablakot is, nem kell DeclineWinstreak !!!
        this.Esc()
    }

    IsDontSaveVisible() {
        ; Dont save - Piros gomb és arany medál
        return (base.IsPixelColor(610, 750, 0x2147ED) && base.IsPixelColor(1050, 450, 0x8f6c02))
    }

    CanCollect() {
        ; zöld collect gomb
        return base.IsPixelColor(800, 900, 0x13CA6C)
    }

    WaitForGameStart() {
        this.WriteDebug("Varom a kovetkezo kort!")        ; Ability vagy a heal villám töltve van
        While (!base.IsPixelColor(1482, 483, 0xe4c99c) && 
        !base.IsPixelColor(1689, 359, 0xe4c99c) && 
        !base.IsPixelColor(1482, 483, 0xDDC397) && 
        !base.IsPixelColor(1689, 359, 0xE3C89B) && 
        !base.IsPixelColor(1482, 483, 0xDec499) && 
        !base.IsPixelColor(1482, 483, 0xDec498) && 
        !base.IsPixelColor(1482, 483, 0xDec49a) && 
        !base.IsPixelColor(1482, 483, 0xDec497) && 
        !base.IsPixelColor(1482, 483, 0xDec379) && 
        !base.IsPixelColor(1482, 483, 0xDec398) && 
        !base.IsPixelColor(1482, 483, 0xdec397) && 
        !base.IsPixelColor(1482, 483, 0xdfc498) && 
        !base.IsPixelColor(1482, 483, 0xdfc499) && 
        !base.IsPixelColor(1482, 483, 0xdfc398)){
            sleep 500
        } 
        
    }

    IsSabotageCharacterChoosing() {
        return base.IsPixelColor(661, 985, 0xC87700)
    }

 /*

   WaitForSabotageStart() {
        this.WriteDebug("Varom hogy kezdodjon a sabotage")
        
        While (!this.IsSabotageCharacterChoosing()) {
            sleep 500
        }

        this.WriteDebug("Indul a visszaszamlalas...")
        ; Visszaszámlálás 11től meg még 2-3mp töltés
        sleep 15000
    }
    */

    DeclineWinstreak() {
        sleep 3000
        if (base.IsPixelColor(880, 780, 0x1C43EA) || base.IsPixelColor(880, 780, 0x1C42EA)) {
            ; Ez egész a főképernyőre visszadob elvileg nem kell Collect
            this.Esc() 
        }
    }
}
