#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\fireflyCharacter.ahk

global firefly := new FireflyCharacter()

class FireFly2GrenadeScript extends ScriptBase {
    Run() {
        ; firefly.Introduction("Ket granatos onmegsemmito")

        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        firefly.SingleRandomMove()
        firefly.ThrowGrenade()
        firefly.WalkIntoGrenade()
        firefly.Heal()
        sleep 8200
        firefly.Heal()
        sleep 600
        firefly.ThrowGrenade()
        firefly.WalkIntoGrenade()

        this.screens.game.Result()
        this.screens.main.ClosePopupsAfterMatch()
    }
}

