#SingleInstance, Force
#Warn All, StdOut

#Include ..\src\statistics.ahk
#Include ..\src\screens\gameScreen.ahk
#Include ..\src\screens\mainScreen.ahk
#Include ..\src\characters\mirageCharacter.ahk

global screens := {}
screens.main := new MainScreen()
screens.game := new GameScreen()

global mirage := new MirageCharacter()

AFK(){
    screens.main.ClosePopupsAfterMatch()
    screens.main.Play()
    screens.game.WaitForGameStart()

    mirage.WalkForward()

    loop 15
    {
        mirage.Heal()
        sleep 500

        mirage.BackJump()
        sleep 200
        mirage.WalkForward()

        if base.HasTextInRect("COLLECT", [845, 865, 300, 60]) {
            break
        } else {
            tooltip nem talaltam a collectet. Ezt talaltam: %ocr%
        }

        if base.HasTextInRect("DONT", [614, 750, 165,60]) {
            screens.main.DontSave()
            break
        }

        sleep 6200
    }

    screens.game.Result()
    screens.main.ClosePopupsAfterMatch()
}

mirage.Introduction("AFK")

#Include ..\src\commands.ahk

Alt & b:: 
    Statistics.Start()
    Loop {
        AFK()
        Statistics.RecordRun()
        sleep 2000
    }

