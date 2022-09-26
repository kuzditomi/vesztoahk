#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\sparkleCharacter.ahk

class SparkleTomiScript extends ScriptBase {
    __New() {
        this.character := new SparkleCharacter()
    }

    GetIntroductionText() {
        return this.character.GetIntroductionText("Granatos heales contract") 
    }

    Run() {
        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        this.character.ThrowGrenade()
        this.character.WalkIntoGrenade()
        this.character.Heal()

        ; nem sikerült belehalni az első bombába
        while(!this.screens.game.IsResultVisible()){
            this.character.TurnBack()
            sleep 2000

            this.character.ThrowGrenade()
            this.character.WalkIntoGrenade()
            sleep 4000

            if(this.screens.main.IsFailVisible()){
                break
            }
        }

        this.WriteDebug("Felrobbantam magam es vege a jateknak")

        this.screens.game.Result()
        this.screens.main.ClosePopupsAfterMatch()
    }
}
