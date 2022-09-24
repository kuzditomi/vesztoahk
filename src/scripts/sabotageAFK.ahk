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
        this.screens.main.Play()
        this.screens.game.WaitForSabotageStart()

        this.character.Heal()

        while(!this.screens.game.IsDontSaveVisible() && !this.screens.game.CanCollect()) {
            sleep 1000
        }

        this.sceens.game.Esc()
        
        this.screens.main.ClosePopupsAfterMatch()
        this.screens.main.CollectChests()
    }
}
