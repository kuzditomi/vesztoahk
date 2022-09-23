#Include %A_LineFile%\..\characterBase.ahk

class SabotageCharacter extends CharacterBase {
    Invisibility() {
        base.MainAction()
    }

    GetIntroductionText(scriptName, gameMode := "Sabotage") {
        return base.GetIntroductionText(scriptName, "Hero with TeamHeal", gameMode)
    }
}
