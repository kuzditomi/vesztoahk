#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\fireflyCharacter.ahk

class FireFlyScript extends ScriptBase {
    __New() {
        this.character := new FireflyCharacter()
    }

    GetIntroductionText() {
        return this.character.GetIntroductionText("Egy granatos onmegsemmito") 
    }

    Run() {
        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        ; this.character.RandomMove()
        this.character.ThrowGrenade()
        this.character.WalkIntoGrenade()
        this.character.Heal()

        ; nem sikerült belehalni az első bombába
        while(!this.screens.game.IsResultVisible() && this.screens.MainScreen.CloseFail()){
            this.character.TurnBack()
            sleep 2000
            this.character.ThrowGrenade()
            this.character.WalkIntoGrenade()
            sleep 4000


            if(this.screens.main.IsFailVisible()){
                break
            }
        }

        this.WriteDebug("Felrobbantam magam es vege a jateknak")

        this.screens.game.Result()
        this.screens.main.ClosePopupsAfterMatch()
        this.screens.main.CollectChests()
    }
}
