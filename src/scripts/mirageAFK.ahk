#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\mirageCharacter.ahk

class MirageAFKScript extends ScriptBase {
    __New(){
        this.character := new MirageCharacter()
    }

    GetIntroductionText() {
        return this.character.GetIntroductionText("AFK") 
    }

    Run() {
        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        this.character.WalkForward()

        while(!this.screens.game.CanCollect()) {
             ; Ha mar meghaltunk, nem kell csinalni semmit, csak varni
            if(this.screens.game.IsResultVisible()){
                sleep 1000
            } else {
            this.character.Heal()
            sleep 500

            this.character.BackJump()
            sleep 200
            this.character.WalkForward()

            sleep 6200
        }

        this.screens.game.Esc()
        this.screens.main.ClosePopupsAfterMatch()
        this.screens.main.CollectChests()
    }
}

