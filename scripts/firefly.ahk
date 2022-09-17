#SingleInstance, Force
#Warn All, StdOut

#Include ..\src\statistics.ahk
#Include ..\src\screens\gameScreen.ahk
#Include ..\src\screens\mainScreen.ahk
#Include ..\src\characters\fireflyCharacter.ahk

global screens := {}
screens.main := new MainScreen()
screens.game := new GameScreen()

global firefly := new FireflyCharacter()

BlowUpMyself() {
    screens.main.Play()
    screens.game.WaitForGameStart()

    firefly.RandomMove()
    firefly.ThrowGrenade()
    firefly.WalkIntoGrenade()

    screens.game.Result()
    screens.main.ClosePopupsAfterMatch()
}

firefly.Introduction("Egy granatos onmegsemmito")

#Include ..\src\commands.ahk

Alt & b:: 
    Statistics.Start()
    Loop {
        BlowUpMyself()
        Statistics.RecordRun()
        sleep 2000
    }

