#Include %A_LineFile%\..\characterBase.ahk

class SparkleCharacter extends CharacterBase {
    ThrowGrenade() {
        click 1500, 547 ;gránát
    }

    WalkIntoGrenade() {
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 404, 80
        sleep 2000
    }

    Heal() {
        click 1670, 420 ;heal
    }

    Introduction(scriptName, gameMode := "King of the hill") {
        base.Introduction(scriptName, "Sparkle", gameMode)
    }
}
