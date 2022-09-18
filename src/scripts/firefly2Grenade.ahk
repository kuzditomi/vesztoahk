#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\fireflyCharacter.ahk

class FireFly2GrenadeScript extends ScriptBase {
    __New(){
        this.character := new FireFlyCharacter()
    }

    GetIntroductionText() {
        return this.character.GetIntroductionText("Ket granatos onmegsemmito") 
    }
    
    Run() {
        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        this.character.SingleRandomMove()
        this.character.ThrowGrenade()
        this.character.WalkIntoGrenade()
        this.character.Heal()
        sleep 8200
        this.character.Heal()
        sleep 600
        this.character.ThrowGrenade()
        this.character.WalkIntoGrenade()

        this.screens.game.Result()
        this.screens.main.ClosePopupsAfterMatch()
    }
}

