#Include %A_LineFile%\..\characterBase.ahk
character:= Cyclops
class CyclopsCharacter extends CharacterBase {
    Felderit() {
        click 1500, 547
    }

    WalkForward() {
        tooltip eloresetalok
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 404, 80
        sleep 2000
        ToolTip
    }

    Heal() {
        click 1670, 420
    }

    Introduction() {
        MsgBox,
        (Ltrim
        Ez a %character% AFK script
            Mielott tovabbmesz, ellenorizd:
                - %character% van kivalasztva
                - Battle Royal van kivalasztva
                - teljes kepernyon fut a bluestacks

                Inditas:`t`tAlt + B
                Pause:`t`tWin + Z
                Reload:`t`Win + Y
                Kilepes:`t`tCtrl + Q

                Hajra!
            )
    }
}
