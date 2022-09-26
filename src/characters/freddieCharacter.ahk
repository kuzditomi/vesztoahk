#Include %A_LineFile%\..\characterWithGrenade.ahk

class FreddieCharacter extends CharacterWithGrenade {
    GetIntroductionText(scriptName, gameMode := "King of the hill") {
        return base.GetIntroductionText(scriptName, "Freddie", gameMode)
    }
}

