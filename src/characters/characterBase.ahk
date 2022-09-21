class CharacterBase {
    RandomMove(){
        Loop 2 {
            click 1500, 347
            MouseMove 154, 614
            MouseClickDrag, Left, 154, 614, 185, 650, 80
            sleep 1500
        }
    }

    SingleRandomMove(){
        click 1500, 347
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 590, 80
        sleep 250
    }

    Heal() {
        click 1670, 420
    }

    MainAction() {
        click 1500, 547
    }

    TurnBack() {
        ; gyors de nem tul gyors
        MouseClickDrag, Left, 1000, 600, 1675, 600, 3
    }

    WalkForward() {
        MouseClickDrag, Left, 154, 614, 154, 404, 80
    }

    GetIntroductionText(scriptName, characterName, gameMode)
    {
        introductionText =
        (Ltrim
            Udv! Ez itt a %characterName% %scriptName% script.

            Mielott tovabbmesz, ellenorizd:
                - %characterName% van kivalasztva
                - %gameMode% van kivalasztva
                - teljes kepernyon fut a bluestacks

                Pause:`t`tWin + Z
                Reload:`tWin + Y
                Kilepes:`tCtrl + Q

                Ha minden kesz, mehet a START!
            )

            return introductionText
        }
    }

