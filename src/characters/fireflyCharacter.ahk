#Include %A_LineFile%\..\characterBase.ahk

class FireflyCharacter extends CharacterBase {
    ThrowGrenade() {
        click 1500, 547
    }

    WalkIntoGrenade() {
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 404, 80
        sleep 4000
    }

    Heal() {
        click 1670, 420
    }

    GetIntroductionText(scriptName, gameMode := "King of the hill") {
        return base.GetIntroductionText(scriptName, "FireFly", gameMode)
    }
}

