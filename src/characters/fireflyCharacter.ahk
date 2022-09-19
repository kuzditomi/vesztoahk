#Include %A_LineFile%\..\characterWithGrenade.ahk

class FireflyCharacter extends CharacterWithGrenade {
    GetIntroductionText(scriptName, gameMode := "King of the hill") {
        return base.GetIntroductionText(scriptName, "FireFly", gameMode)
    }
}

