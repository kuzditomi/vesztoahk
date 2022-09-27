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
        this.WriteDebug("Fut az AFK program")

        while(!this.screens.game.IsDontSaveVisible() && !this.screens.game.CanCollect()) {
            ; Ha mar meghaltunk, nem kell csinalni semmit, csak varni
            if(this.screens.game.IsResultVisible()){
                this.WriteDebug("Azt hiszem, meghaltam")
                sleep 1000
            } else {
            this.WriteDebug("Fut az AFK program")
            this.character.Scan()
            sleep 50
            this.character.Heal()
            sleep 50
            this.character.SingleRandomMove()

            sleep 12000
            }
        }
        this.WriteDebug("Vege a jateknak, kilepek")
        this.screens.game.Esc()
        this.screens.main.ClosePopupsAfterMatch()
        this.screens.main.CollectChests()
    }
}