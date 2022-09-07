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
            click 1500, 347
            MouseMove 154, 614
            MouseClickDrag, Left, 154, 614, 154, 590, 80
            sleep 250
        
    }

    GetIntroductionText() {
        generalIntroText = 
        (Ltrim
            Mielott tovabbmesz, ellenorizd:
                - firefly van kivalasztva
                - king of the hill van kivalasztva
                - teljes kepernyon fut a bluestacks

                Inditas:`t`tAlt + B
                Pause:`t`tCtrl + Z
                Folytatas:`tCtrl + Y
                Kilepes:`t`tCtrl + Q

                Hajra!
            )
    GetIntroMirageAFK() {
        generalIntroText = 
        (Ltrim
            Mielott tovabbmesz, ellenorizd:
                - Mirage van kivalasztva
                - Battle Royal van kivalasztva
                - teljes kepernyon fut a bluestacks

                Inditas:`t`tAlt + B
                Pause:`t`tCtrl + Z
                Folytatas:`tCtrl + Y
                Kilepes:`t`tCtrl + Q

                Hajra!
            )

            return generalIntroText
        }
    }