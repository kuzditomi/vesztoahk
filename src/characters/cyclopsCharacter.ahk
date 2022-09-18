#Include %A_LineFile%\..\characterBase.ahk

class CyclopsCharacter extends CharacterBase {
    Felderit() {
        click 1500, 547
    }

    WalkForward() {
        tooltip eloresetalok
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 404, 80
        sleep 2000
        ToolTip
    }

    Heal() {
        click 1670, 420
    }

    GetIntroductionText(scriptName, gameMode := "Battle Royal") {
        return base.GetIntroductionText(scriptName, "Cyclops", gameMode)
    }
}
