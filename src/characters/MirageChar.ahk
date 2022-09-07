#Include %A_LineFile%\..\characterBase.ahk

class FireflyCharacter extends CharacterBase {
    backJump() {
        click 1500, 547 ;gránát
    }

    WalkForward() {
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 404, 80
        sleep 2000
    }

    Heal() {
        click 1670, 420 ;heal
        }

    Introduction() {
        introductionText := base.GetIntroMirageAFKt()
        MsgBox,
        (Ltrim
            Ez a Mirage AFK script

            %introductionText%
        )
    }
}

