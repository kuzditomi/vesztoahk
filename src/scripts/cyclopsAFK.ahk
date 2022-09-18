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
            this.character.Felderit()
            sleep 50
            this.character.Heal()
            sleep 50
            this.character.SingleRandomMove()

            if base.HasTextInRect("COLLECT", [845, 865, 300, 60]) 
                break
            else 
                tooltip nem talaltam a collectet. Ezt talaltam: %ocr% 

            if base.HasTextInRect("DONT", [614, 750, 165,60]) {
                this.screens.main.DontSave()
                break
            }

            sleep 12000 
        }

        this.screens.game.Result()
        this.screens.main.ClosePopupsAfterMatch()
        this.screens.main.CollectWinChest()
    }
}
