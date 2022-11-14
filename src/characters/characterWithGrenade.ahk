#Include %A_LineFile%\..\characterBase.ahk

class CharacterWithGrenade extends CharacterBase {
    ThrowGrenade() {
        this.WriteDebug("Dobom a bombat...")

        base.MainAction()
    }

    WalkIntoGrenade() {
        this.WriteDebug("Belesetalok a bombaba")

        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 404, 80
    }

        RovidWalkIntoGrenade() {
        this.WriteDebug("Belesetalok a bombaba")

        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 550, 80
    }
}

