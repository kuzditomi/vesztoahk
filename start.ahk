#Warn All
#Include src\startGui.ahk
#Include src\scripts\freddieBuko.ahk
#Include src\scripts\firefly2Grenade.ahk
#Include src\scripts\cyclopsAFK.ahk
#Include src\scripts\mirageAFK.ahk
#Include src\scripts\sparkleOdon.ahk
#Include src\scripts\SparkleMax2Granat.ahk
#Include src\scripts\sparkleTomi.ahk
#Include src\scripts\stalkerAFK.ahk
#include src\scripts\sabotageAFK.ahk
#include src\scripts\testScript.ahk
#include src\debugGui.ahk

CoordMode, ToolTip, Screen
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

global currentScript
global scriptToRun

starter := new StartGui()
starter.Open("SelectScript", "StartGame")
starter.ScriptSelected("freddieBuko")

StartGame() {
    scriptToRun := currentScript
    Gui, Destroy
    RunScript()
}

SelectScript(scriptName) {
    Gui, Submit, NoHide

    Switch scriptName
    {
        Case "freddieBuko":{
            currentScript := new FreddieBukoScript()
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
        Case "Sparkle2Grenade":{
            currentScript := new Sparkle2Grenade()
        }
        Case "sparkleTomi":{
            currentScript := new SparkleTomiScript()
        }
        Case "stalkerAFK":{
            currentScript := new StalkerAFKScript()
        }
        Case "sabotageAFK":{
            currentScript := new SabotageAFKScript()
        }
        Case "testScript":{
            currentScript := new TestScript()
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

    if WinExist("BlueStacks"){
        WinActivate
        WinMove, BlueStacks,, 0, 0, 960,540
    }

    Statistics.Start()
    DebugGui.Init()
    DebugGui.Show()

    Loop {
        scriptToRun.Run()
        Statistics.RecordRun()
    }
}

Alt & b:: 
    RunScript()
