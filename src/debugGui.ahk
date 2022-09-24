global debugText

class DebugGui {
    Init(){
        Gui, DebugGui:New, , Debug
        Gui, DebugGui:Add,Text, x10 y10 w350 h80 vdebugText
        Gui, DebugGui:+AlwaysOnTop
    }

    Show() {
        Gui, DebugGui:Show, h100 w400 x1000 y900
    }

    Write(debugMessage) {
        GuiControl,DebugGui:Text, debugText, % debugMessage
    }

    Close() {
        Gui, DebugGui:Hide
    }
}
