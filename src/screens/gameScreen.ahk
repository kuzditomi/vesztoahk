#Include %A_LineFile%\..\screenBase.ahk

class GameScreen extends ScreenBase {
    Result() {
        sleep 3000
        click 235, 956 ;results
        sleep 1000
        send {esc}
    }

    WaitForGameStart() {
        While !base.HasTextInRect("STARTS", [510, 970, 100, 45]) 
        {
            sleep 2000
        }

        sleep 8000
    }
}