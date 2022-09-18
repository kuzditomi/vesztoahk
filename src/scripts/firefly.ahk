#Include %A_LineFile%\..\scriptBase.ahk
#Include %A_LineFile%\..\..\characters\fireflyCharacter.ahk

global firefly := new FireflyCharacter()

class FireFlyScript extends ScriptBase {
    Run() {
        ; firefly.Introduction("Egy granatos onmegsemmito")
        this.screens.main.Play()
        this.screens.game.WaitForGameStart()

        firefly.RandomMove()
        firefly.ThrowGrenade()
        firefly.WalkIntoGrenade()

        this.screens.game.Result()
        this.screens.main.ClosePopupsAfterMatch()
    }
}

