#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\cyclopsCharacter.ahk

global cyclops := new CyclopsCharacter()

class CyclopsAFKScript extends ScriptBase {
    Run() {
        ; cyclops.Introduction("AFK")

        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        cyclops.SingleRandomMove()

        loop 9
        {
            cyclops.Felderit()
            sleep 50
            cyclops.Heal()
            sleep 50
            cyclops.SingleRandomMove()

            if base.HasTextInRect("COLLECT", [845, 865, 300, 60]) 
                break
            else 
                tooltip nem talaltam a collectet. Ezt talaltam: %ocr% 

            if base.HasTextInRect("DONT", [614, 750, 165,60]) {
                screens.main.DontSave()
                break
            }

            sleep 12000 
        }

        screens.game.Result()
        screens.main.ClosePopupsAfterMatch()
        screens.main.CollectWinChest()
    }
}
