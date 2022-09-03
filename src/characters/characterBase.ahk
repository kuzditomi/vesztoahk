class CharacterBase {
    RandomMove(){
        click 1500, 347 ;sima click
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 590, 80
        sleep 2500

        click 1500, 347 ;sima click
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 590, 80
        sleep 2500

        click 1500, 347 ;sima click
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 590, 80
        sleep 2500
    }

    GetIntroductionText() {
        generalIntroText = 
        (Ltrim
            Mielott tovabbmesz, ellenorizd:
            - firefly van kivalasztva
            - king of the hill van kivalasztva
            - teljes kepernyon fut a bluestacks

            Inditas:`t`tCtrl + B
            Pause:`t`tCtrl + Z
            Folytatas:`tCtrl + Y
            Kilepes:`t`tCtrl + Q

            Hajra!
        )

        return generalIntroText
    }
}