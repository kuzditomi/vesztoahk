#Include %A_LineFile%\..\characterWithGrenade.ahk

class SparkleCharacter extends CharacterWithGrenade {
    GetIntroductionText(scriptName, gameMode := "King of the hill") {
        return base.GetIntroductionText(scriptName, "Sparkle", gameMode)
    }
}
