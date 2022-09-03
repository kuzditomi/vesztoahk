#Include %A_LineFile%\..\screenBase.ahk

class GameScreen extends ScreenBase {
    Result() {
        sleep 3000
        click 235, 956 ;results
        sleep 4000
        send {esc}
    }
}