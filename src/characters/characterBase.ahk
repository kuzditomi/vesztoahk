class CharacterBase {
    RandomMove(){
        Loop 2 {
            click 1500, 347
            MouseMove 154, 614
            MouseClickDrag, Left, 154, 614, 154, 590, 80
            sleep 2500
        }
    }

    SingleRandomMove(){
        tooltip SingRandFwrd
        click 1500, 347
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 590, 80
        sleep 250
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

                Inditas:`t`tAlt + B
                Pause:`t`tWin + Z
                Reload:`tWin + Y
                Kilepes:`tCtrl + Q

                Hajra!
        )

        return introductionText
    }
}