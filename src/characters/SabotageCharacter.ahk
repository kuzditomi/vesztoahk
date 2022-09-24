#Include %A_LineFile%\..\characterBase.ahk

class SabotageCharacter extends CharacterBase {
    Invisibility() {
        base.MainAction()
    }

    Heal() {
        base.Heal()
    }

    GetIntroductionText(scriptName, gameMode := "Team heales karakter") {
        return base.GetIntroductionText(scriptName, "Sabotage", gameMode)
    }
}
