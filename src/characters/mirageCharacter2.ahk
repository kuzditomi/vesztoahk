#Include %A_LineFile%\..\characterBase.ahk

class MirageCharacter extends CharacterBase {
    BackJump() {
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

    Introduction(scriptName, gameMode := "Battle Royal") {
        base.Introduction(scriptName, "Mirage", gameMode)
    }
}
