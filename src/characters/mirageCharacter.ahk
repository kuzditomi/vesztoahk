#Include %A_LineFile%\..\characterBase.ahk

class MirageCharacter extends CharacterBase {
    BackJump() {
        base.MainAction()
    }

    GetIntroductionText(scriptName, gameMode := "Battle Royal") {
        return base.GetIntroductionText(scriptName, "Mirage", gameMode)
    }
}
