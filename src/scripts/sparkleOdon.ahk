#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\sparkleCharacter.ahk

global sparkle := new SparkleCharacter()

class SparkleOdonScript extends ScriptBase {
    Run() {
        ; sparkle.Introduction("Onmegsemmisito")
        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        sparkle.SingleRandomMove()
        sparkle.ThrowGrenade()
        sparkle.WalkIntoGrenade()
        sparkle.Heal()
        sleep 6500
        sparkle.Heal()
        sleep 700
        sparkle.ThrowGrenade()
        sparkle.WalkIntoGrenade()

        this.screens.game.Result()
        this.screens.main.ClosePopupsAfterMatch()
    }
}
