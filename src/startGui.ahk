global startFn
global selectFn
global introductionText

class StartGui {
    __New() {
        this.x := 20
        this.y := 100
    }

    Open(selectFunction, startFunction) {
        selectFn := selectFunction

        Gui, Font, s20
        Gui, Add, Text,, HunVenek script gyujtemeny
        Gui, Font, s7

        this.AddButton("Freddie buko", "freddieBuko")

        this.x += 120
        this.AddButton("FireFly Supreme", "fireflySupreme")
        
        this.x += 120
        this.AddButton("Smog/Doc buko", "smogBuko")

        this.y += 90
        this.x := 20
        this.AddButton("Firefly 2 granat buko", "firefly2Grenade")

        this.x += 120
        this.AddButton("Sparkle", "sparkle")

       /*

         this.x += 120
        this.AddButton("Sparkle Max", "Sparkle2Grenade") 
        */
        
        this.x += 120
        this.AddButton("Sparkle Tomi", "sparkleTomi")

        this.x := 20
        this.y += 90
        this.AddButton("Cyclops AFK", "cyclopsAFK")

        this.x += 120
        this.AddButton("Mirage AFK", "mirageAFK")

        this.x += 120
        this.AddButton("Stalker AFK", "stalkerAFK")

        this.x := 20
        this.y += 90
        this.AddButton("Sabotage AFK", "sabotageAFK")

        Gui Add, Text, x620 y100 w350 h250 vintroductionText

        Gui Add, Button, x50 y530 w400 h50 g%startFunction%, Start

        Gui Show, h600 w1000
    }

    AddButton(text, parameter) {
        x := this.x
        y := this.y

        Gui, Font, s10
        GUI, Add, Button, HwndMyBtn w100 h70 x%x% y%y%, %text%
        fn := StartGui.ScriptSelected.Bind(StartGui, parameter)
        GuiControl, +g, % MyBtn, % fn
    }

    ScriptSelected(scriptName) {
        introText := selectFn.(scriptName)

        GuiControl,, introductionText, % introText
    }
}
