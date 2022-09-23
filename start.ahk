#Warn All, StdOut
#Include src\startGui.ahk
#Include src\scripts\firefly.ahk
#Include src\scripts\firefly2Grenade.ahk
#Include src\scripts\cyclopsAFK.ahk
#Include src\scripts\mirageAFK.ahk
#Include src\scripts\sparkleOdon.ahk
#Include src\scripts\stalkerAFK.ahk
#include src\scripts\sabotageAFK.ahk

global currentScript
global scriptToRun

starter := new StartGui()
starter.Open("SelectScript", "StartGame")

StartGame() {
    scriptToRun := currentScript
    Gui, Destroy
    RunScript()
}

SelectScript(scriptName) {
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
        Case "stalkerAFK":{
            currentScript := new StalkerAFKScript()
        }
        Case "sabotageAFK":{
            currentScript := new SabotageAFKScript()
        }
        Default: {
            MsgBox, "Valami hiba tortent :("
            ExitApp
        }
    }

    introText := currentScript.GetIntroductionText()
    return introText
}

#Include src\commands.ahk

RunScript() {
    if(!scriptToRun){
        MsgBox, Kerlek valassz ki egy scriptet!
        return
    }

    Statistics.Start()
    Loop {
        scriptToRun.Run()
        Statistics.RecordRun()
        sleep 2000
    }
}

Alt & b:: 
    RunScript()
