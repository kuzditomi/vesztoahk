#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\fireflyCharacter.ahk

class FireFlySupremeScript extends ScriptBase {
    __New() {
        this.character := new FireFlyCharacter()
    }

    GetIntroductionText() {
        return this.character.GetIntroductionText("Supreme Firefly buko es AFK") 
    }
    
    Run() {
        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        this.character.ThrowGrenade()
        this.character.RovidWalkIntoGrenade()
        this.character.Heal()
        this.character.TurnBack()
        this.character.WalkIntoGrenade()

        sleep 6000
        this.character.Heal()

        while(!this.screens.game.IsResultVisible()){
            this.WriteDebug("Kovetkezo bomba")

            this.character.ThrowGrenade()
            this.character.WalkIntoGrenade()
            sleep 4000

            if(this.screens.main.IsFailVisible()) {
                this.WriteDebug("Tul hamar meghaltam")

                break
            }
            
            this.character.TurnBack()
        }

        this.WriteDebug("Vege a jateknak")

        this.screens.game.Result()
        this.screens.main.ClosePopupsAfterMatch()
    }
}

