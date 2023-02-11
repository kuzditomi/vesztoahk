#Include %A_LineFile%\..\characterWithRocket.ahk

class SmogCharacter extends CharacterWithRocket {
    GetIntroductionText(scriptName, gameMode := "King of the hill") {
        return base.GetIntroductionText(scriptName, "Smog", gameMode)
    }
}

