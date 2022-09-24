#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\stalkerCharacter.ahk

class SabotageAFKScript extends ScriptBase {
    __New() {
        this.character := new SabotageCharacter()
    }

    GetIntroductionText() {
        return this.character.GetIntroductionText("AFK") 
    }

    Run() {
        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        while(!this.screens.game.CanCollect()) {
            ; Ha mar meghaltunk, nem kell csinalni semmit, csak varni
            if(this.screens.game.IsResultVisible()){
                sleep 1000
            } else {
                this.character.SingleRandomMove()

                this.character.Heal()
                sleep 5000
            }
        }

        this.screens.game.Esc()
        this.screens.main.ClosePopupsAfterMatch()
        this.screens.main.CollectWinChest()
    }
}