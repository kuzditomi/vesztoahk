#Include %A_LineFile%\..\characterBase.ahk

class CyclopsCharacter extends CharacterBase {
    Scan() {
        base.MainAction()
    }

    GetIntroductionText(scriptName, gameMode := "Battle Royal") {
        return base.GetIntroductionText(scriptName, "Cyclops", gameMode)
    }
}
