#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\freddieCharacter.ahk

class FreddieBukoScript extends ScriptBase {
    __New() {
        this.character := new FreddieCharacter()
    }

    GetIntroductionText() {
        return this.character.GetIntroductionText("egy granatos onmegsemmito") 
    }

    Run() {
        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        this.character.RandomMove()

        ; nem sikerült belehalni az első bombába
        while(!this.screens.game.IsResultVisible()) {
            this.WriteDebug("Kovetkezo bomba")

            this.character.ThrowGrenade()
            this.character.WalkIntoGrenade()
            sleep 4000

            if(this.screens.main.IsFailVisible()){
                this.WriteDebug("Tul hamar meghaltam")

                break
            }
            
            this.character.TurnBack()
        }

        this.WriteDebug("Felrobbantam magam es vege a jateknak")

        this.screens.game.Result()
        this.screens.main.ClosePopupsAfterMatch()
    }
}
