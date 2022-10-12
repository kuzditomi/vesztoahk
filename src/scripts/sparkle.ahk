#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\sparkleCharacter.ahk

class SparkleScript extends ScriptBase {
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
            this.character.ThrowGrenade()
            this.character.WalkIntoGrenade()
            this.character.Heal()
            this.character.TurnBack()
            this.character.WalkIntoGrenade()
            sleep 3500
            this.character.Heal()
            sleep 3300
            this.character.ThrowGrenade()
            this.character.WalkIntoGrenade()
        
                ; nem sikerült belehalni az első bombába
        while(!this.screens.game.IsResultVisible()){
            this.character.TurnBack()
            this.character.ThrowGrenade()
            this.character.WalkIntoGrenade()

            if(this.screens.main.IsFailVisible()){
                break
            }
        }
        
        this.screens.game.Result()
        this.screens.main.ClosePopupsAfterMatch()
        this.screens.main.CollectChests()
    }
}
