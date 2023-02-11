#Include %A_LineFile%\..\characterBase.ahk

class CharacterWithRocket extends CharacterBase {
    LaunchRocket() {
        this.WriteDebug("Lovom a raketat...")

        base.MainAction()
    }

    WalkForward() {
        this.WriteDebug("Elore setalok")

        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 404, 80
    }

        RovidWalkIntoGrenade() {
        this.WriteDebug("Elore setalok")

        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 550, 80
    }
}

