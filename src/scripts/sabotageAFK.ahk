#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\SabotageCharacter.ahk

class SabotageAFKScript extends ScriptBase {
    __New() {
        this.character := new SabotageCharacter()
    }

    GetIntroductionText() {
        return this.character.GetIntroductionText("AFK") 
    }

    Run() {
        this.WriteDebug("Inditom a jatekot a PLAY-el")

        this.screens.main.Play()
        this.screens.game.WaitForSabotageStart()

        this.character.Heal()

        this.WriteDebug("Varok hogy lassam a sabotage jatek veget")
        while(!this.screens.game.IsDontSaveVisible() && !this.screens.game.CanCollect()) {

            sleep 1000
        }

        this.WriteDebug("Vege a jateknak, kilepek")
        sleep 2000
        this.screens.game.Esc()
        
        sleep 1000
        this.screens.main.ClosePopupsAfterMatch()
        this.screens.main.CollectChests()

        ; Ládanyitós contract pl
        this.screens.main.ClosePopupsAfterMatch()
    }
}