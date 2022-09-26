#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\sparkleCharacter.ahk

class SparkleOdonScript extends ScriptBase {
    __New(){
        this.character := new SparkleCharacter()
    }

    GetIntroductionText() {
        return this.character.GetIntroductionText("Onmegsemmisito") 
    }
    
    Run() {
        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        ; while(!this.screens.game.IsResultVisible() && !this.screens.MainScreen.CloseFail()){
            this.character.SingleRandomMove()
            this.character.ThrowGrenade()
            this.character.WalkIntoGrenade()
            this.character.Heal()
            sleep 5500
            this.character.Heal()
            sleep 1700
            this.character.ThrowGrenade()
            this.character.WalkIntoGrenade()
        
        this.screens.game.Result()
        this.screens.main.ClosePopupsAfterMatch()
        this.screens.main.CollectChests()
    }
}
