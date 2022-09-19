#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\fireflyCharacter.ahk

class FireFlyScript extends ScriptBase {
    __New() {
        this.character := new FireflyCharacter()
    }

    GetIntroductionText() {
        return this.character.GetIntroductionText("Egy granatos onmegsemmito") 
    }

    Run() {
        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        this.character.RandomMove()
        this.character.ThrowGrenade()
        this.character.WalkIntoGrenade()

        if(this.screens.game.IsResultVisible()){
            this.screens.game.Result()
        } else {
            ; nem sikerült belehalni az első bombába
            this.character.TurnBack()
            this.character.ThrowGrenade()
            this.character.WalkIntoGrenade()
            this.screens.game.Result()
        }

        this.screens.main.ClosePopupsAfterMatch()
    }
}
