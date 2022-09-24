#Include %A_LineFile%\..\..\screens\gameScreen.ahk
#Include %A_LineFile%\..\..\screens\mainScreen.ahk
#Include %A_LineFile%\..\..\debugGui.ahk

class ScriptBase {
    screens := { main: new MainScreen(), game: new GameScreen() }

    Run() {
    }

    WriteDebug(message) {
        DebugGui.Write(message)
    }

    GetIntroductionText(){
        intrtext := this.character.GetIntroductionText() 
        return intrtext
    }
}