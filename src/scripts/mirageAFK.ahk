#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\mirageCharacter.ahk

global mirage := new MirageCharacter()

class MirageAFKScript extends ScriptBase {
    Run() {
        ; mirage.Introduction("AFK")
        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        mirage.WalkForward()

        loop 15
        {
            mirage.Heal()
            sleep 500

            mirage.BackJump()
            sleep 200
            mirage.WalkForward()

            if base.HasTextInRect("COLLECT", [845, 865, 300, 60]) {
                break
            } else {
                tooltip nem talaltam a collectet. Ezt talaltam: %ocr%
            }

            if base.HasTextInRect("DONT", [614, 750, 165,60]) {
                this.screens.main.DontSave()
                break
            }

            sleep 6200
        }

        this.screens.game.Result()
        this.screens.main.ClosePopupsAfterMatch()
    }
}

