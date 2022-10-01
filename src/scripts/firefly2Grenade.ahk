#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\fireflyCharacter.ahk

class FireFly2GrenadeScript extends ScriptBase {
    __New() {
        this.character := new FireFlyCharacter()
    }

    GetIntroductionText() {
        return this.character.GetIntroductionText("Ket granatos onmegsemmito") 
    }
    
    Run() {
        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        ; this.character.SingleRandomMove()
        this.character.ThrowGrenade()
        this.character.WalkIntoGrenade()
        this.character.Heal()
        this.character.TurnBack()
        this.character.WalkIntoGrenade()

        sleep 5000
        this.character.Heal()

        while(!this.screens.game.IsResultVisible()){
            this.character.ThrowGrenade()
            this.character.WalkIntoGrenade()
            sleep 4000

            if(this.screens.main.IsFailVisible()){
                break
            }
            
            this.character.TurnBack()
        }
        this.WriteDebug("Felrobbantam magam es vege a jateknak")

        this.screens.game.Result()
        this.screens.main.ClosePopupsAfterMatch()
    }
}

