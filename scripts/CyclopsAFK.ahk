#SingleInstance, Force
#Warn All, StdOut

#Include ..\src\statistics.ahk
#Include ..\src\screens\gameScreen.ahk
#Include ..\src\screens\mainScreen.ahk
#Include ..\src\characters\CyclopsCharacter.ahk

global screens := {}
global Cyclops := new CyclopsCharacter()

screens.main := new MainScreen()
screens.game := new GameScreen()

AFK(){
    loop 5
    {
    screens.main.ClosePopupsAfterMatch()
    screens.main.Play()
    screens.game.WaitForGameStart()

    base.SingleRandomMove()

        loop 9
        {
            Cyclops.Felderit()
            sleep 50
            Cyclops.Heal()
            sleep 50
            base.SingleRandomMove()

            if base.HasTextInRect("COLLECT", [845, 865, 300, 60]) 
                break
             else 
                tooltip nem talaltam a collectet. Ezt talaltam: %ocr%            

            if base.HasTextInRect("DONT", [614, 750, 165,60]) {
                screens.main.DontSave()
                break
            }

            sleep 12000 
        }

    screens.game.Result()
    screens.main.ClosePopupsAfterMatch()
        
    }
    screens.main.CollectWinChest()
}
Cyclops.Introduction()

#Include ..\src\commands.ahk


Alt & b:: 
    Statistics.Start()
    Loop {
        AFK()
        Statistics.RecordRun()
        sleep 2000
    }

