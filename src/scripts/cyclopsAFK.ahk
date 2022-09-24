#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\cyclopsCharacter.ahk

class CyclopsAFKScript extends ScriptBase {
    __New(){
        this.character := new CyclopsCharacter()
    }

    GetIntroductionText() {
        return this.character.GetIntroductionText("AFK") 
    }

    Run() {
        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        this.character.SingleRandomMove()

        loop 9
        {
            this.character.Scan()
            sleep 50
            this.character.Heal()
            sleep 50
            this.character.SingleRandomMove()

            sleep 12000 
        }

        this.screens.game.Result()
        this.screens.main.ClosePopupsAfterMatch()
        this.screens.main.CollectChests()
    }
}
