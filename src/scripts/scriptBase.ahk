#Include %A_LineFile%\..\..\screens\gameScreen.ahk
#Include %A_LineFile%\..\..\screens\mainScreen.ahk

class ScriptBase {
    screens := { main: new MainScreen(), game: new GameScreen() }

    Run() {
    }

    GetIntroductionText(){
        intrtext := this.character.GetIntroductionText() 
        return intrtext
    }
}