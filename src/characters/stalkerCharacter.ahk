#Include %A_LineFile%\..\characterBase.ahk

class StalkerCharacter extends CharacterBase {
    Invisibility() {
        base.MainAction()
    }

    GetIntroductionText(scriptName, gameMode := "Battle Royal") {
        return base.GetIntroductionText(scriptName, "Stalker", gameMode)
    }
}
