#SingleInstance, Force
#Warn All, StdOut

#Include ..\src\statistics.ahk
#Include ..\src\screens\gameScreen.ahk
#Include ..\src\screens\mainScreen.ahk
#Include ..\src\characters\SparkleCharacter.ahk

global screens := {}

screens.main := new MainScreen()
screens.game := new GameScreen()

global sparkle := new SparkleCharacter()


BlowUpMyself(){
    screens.main.Play()
    screens.game.WaitForGameStart()

    sparkle.SingleRandomMove()
    sparkle.ThrowGrenade()
    sparkle.WalkIntoGrenade()
    sparkle.Heal()
     sleep 6500
    sparkle.Heal()
    sleep 700
    sparkle.ThrowGrenade()
    sparkle.WalkIntoGrenade()
    screens.game.Result()
    screens.main.ClosePopupsAfterMatch()
}

sparkle.Introduction()

#Include ..\src\commands.ahk

Alt & b:: 
    Statistics.Start()
    Loop {
        BlowUpMyself()
        Statistics.RecordRun()
        sleep 2000
    }

