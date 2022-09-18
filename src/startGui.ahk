global ScriptNameSelector

class StartGui {
    startFunctionName := ""

    Open(startFunctionName) {
        this.startFunctionName := startFunctionName

        Gui Add, Text, w60, Caption
        ; Gui Add, DropDownList, vScriptNameSelector, Freddie buko||Cyclops|asd

        this.AddButton("Freddie buko", "firefly")
        this.AddButton("Freddie 2 granat buko", "firefly2Grenade")
        this.AddButton("Cyclops AFK", "cyclopsAFK")
        this.AddButton("Mirage AFK", "mirageAFK")
        this.AddButton("Sparkle Odon", "sparkleOdon")

        Gui Show, h600
    }

    AddButton(text, parameter) {
        GUI, Add, Button, HwndMyBtn, %text%
        fn := Func(this.startFunctionName).Bind(parameter)
        GuiControl, +g, % MyBtn, % fn
    }
}
