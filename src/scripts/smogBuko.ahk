#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\smogCharacter.ahk

class SmogBukoScript extends ScriptBase {
    __New() {
        this.character := new SmogCharacter()
    }

    GetIntroductionText() {
        return this.character.GetIntroductionText("raketas onmegsemmito")
    }

    Run() {
        this.screens.main.Play()
        this.screens.game.WaitForGameStart()
        this.character.TurnBack()
        this.character.WalkForward()
        this.character.WalkForward()
        this.character.WalkForward()
        this.screens.game.WaitForRocket()
        this.character.LaunchRocket()
        sleep 2000

        while(!this.screens.game.IsResultVisible()) {
            this.WriteDebug("Kovetkezo raketa")
            this.character.RovidWalk()
            this.screens.game.WaitForRocket()
            ;sleep 500
            this.character.LaunchRocket()
            
            if(this.screens.main.IsFailVisible()){
                this.WriteDebug("Tul hamar meghaltam")
                break
            }

            sleep 4000
        }

        this.WriteDebug("Felrobbantam magam es vege a jateknak")

        this.screens.game.Result()
        this.screens.main.ClosePopupsAfterMatch()
    }
}
