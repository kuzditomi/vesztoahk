#Include %A_LineFile%\..\characterBase.ahk

class MirageCharacter extends CharacterBase {
    BackJump() {
        click 1500, 547 ;gránát
    }

    WalkForward() {
        tooltip eloresetalok
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 404, 80
        sleep 2000
        ToolTip
    }

    Heal() {
        click 1670, 420 ;heal
    }

    Introduction() {
        MsgBox,
        (Ltrim
        Ez a Mirage AFK script
            Mielott tovabbmesz, ellenorizd:
                - Mirage van kivalasztva
                - Battle Royal van kivalasztva
                - teljes kepernyon fut a bluestacks

                Inditas:`t`tAlt + B
                Pause:`t`tWin + Z
                Folytatas:`tWin + Y
                Kilepes:`t`tCtrl + Q

                Hajra!
            )
    }
}
