#SingleInstance, Force
#Warn All, StdOut

#Include ..\src\statistics.ahk
#Include ..\src\screens\gameScreen.ahk
#Include ..\src\screens\mainScreen.ahk
#Include ..\src\characters\MirageChar.ahk

global screens := {}

screens.main := new MainScreen()
screens.game := new GameScreen()

global mirage := new MirageChar()

AFK(){
    screens.main.ClosePopupsAfterMatch()
    screens.main.Play()
    screens.game.WaitForGameStart()
    
    mirage.RandomMove()
While !base.HasTextInRect("COLLECT", [867, 877, 300, 60]) or !base.HasTextInRect("DONTS", [614, 750, 165,60])
{
    mirage.ThrowGrenade()
    mirage.WalkIntoGrenade()
}
    screens.game.Result()
    screens.main.ClosePopupsAfterMatch()
}

mirage.Introduction()

#Include ..\src\commands.ahk

Alt & b:: 
    Statistics.Start()
    Loop {
        AFK()
        Statistics.RecordRun()
        sleep 2000
    }

