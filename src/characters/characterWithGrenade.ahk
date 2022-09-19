#Include %A_LineFile%\..\characterBase.ahk

class CharacterWithGrenade extends CharacterBase {
    ThrowGrenade() {
        base.MainAction()
    }

    WalkIntoGrenade() {
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 404, 80
        sleep 4000
    }
}

