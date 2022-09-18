global startFn
global introductionText

class StartGui {
    Open(startFunction) {
        startFn := startFunction

        Gui Add, Text, , hun venek ahk script gyujtemeny

        this.AddButton("Freddie buko", "firefly")
        this.AddButton("Freddie 2 granat buko", "firefly2Grenade")
        this.AddButton("Cyclops AFK", "cyclopsAFK")
        this.AddButton("Mirage AFK", "mirageAFK")
        this.AddButton("Sparkle Odon", "sparkleOdon")

        Gui Add, Text, w400 h400 vintroductionText, 

        Gui Show, h600 w500
    }

    AddButton(text, parameter) {
        GUI, Add, Button, HwndMyBtn, %text%
        fn := StartGui.ScriptSelected.Bind(StartGui, parameter)
        GuiControl, +g, % MyBtn, % fn
    }

    ScriptSelected(scriptName) {
        introText := startFn.(scriptName)

        GuiControl,, introductionText, % introText
    }
}
