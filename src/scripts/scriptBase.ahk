#Include %A_LineFile%\..\..\screens\gameScreen.ahk
#Include %A_LineFile%\..\..\screens\mainScreen.ahk

class ScriptBase {
    screens := {}

    __New() {
        this.screens.main := new MainScreen()
        this.screens.game := new GameScreen()
    }

    Run() {

    }
}