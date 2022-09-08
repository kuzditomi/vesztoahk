#Include %A_LineFile%\..\characterBase.ahk

class FireflyCharacter extends CharacterBase {
    ThrowGrenade() {
        click 1500, 547 ;gránát
    }

    WalkIntoGrenade() {
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 404, 80
        sleep 2000
    }

    Heal() {
        click 1670, 420 ;heal
    }

    Introduction() {
           MsgBox,
        (Ltrim
            Ez a Firefly onmegsemmisito script.
            Mielott tovabbmesz, ellenorizd:
                - firefly van kivalasztva
                - king of the hill van kivalasztva
                - teljes kepernyon fut a bluestacks

                Inditas:`t`tAlt + B
                Pause:`t`tWin + Z
                Folytatas:`tWin + Y
                Kilepes:`t`tCtrl + Q

                Hajra!
            )
    }
}

