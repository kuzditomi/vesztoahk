#Warn All, StdOut
#Include src\startGui.ahk
#Include src\scripts\firefly.ahk
#Include src\scripts\firefly2Grenade.ahk
#Include src\scripts\cyclopsAFK.ahk
#Include src\scripts\mirageAFK.ahk
#Include src\scripts\sparkleOdon.ahk

starter := new StartGui()
starter.Open("StartGame")

global currentScript

StartGame(scriptName) {
    Gui, Submit, NoHide

    Switch scriptName
    {
        Case "firefly":{
            currentScript := new FireFlyScript()
        }
        Case "firefly2Grenade":{
            currentScript := new FireFly2GrenadeScript()
        }
        Case "cyclopsAFK":{
            currentScript := new CyclopsAFKScript()
        }
        Case "mirageAFK":{
            currentScript := new MirageAFKScript()
        }
        Case "sparkleOdon":{
            currentScript := new SparkleOdonScript()
        }
        Default: {
            MsgBox, "Valami hiba tortent :("
            ExitApp
        }
    }

    Gui, Destroy
}

#Include src\commands.ahk

Alt & b:: 
    Statistics.Start()
    Loop {
        currentScript.Run()
        Statistics.RecordRun()
        sleep 2000
    }