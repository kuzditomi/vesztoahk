Class Character {
    RandomMove(){
        click 1500, 347 ;sima click
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 590, 80
        sleep 9500

        click 1500, 347 ;sima click
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 590, 80
        sleep 2600

        click 1500, 347 ;sima click
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 590, 80
        sleep 2500
    }

    ThrowGrenade() {
        IfWinExist BlueStacks App Player
            WinActivate
        click 1500, 547 ;gránát
    }

    WalkIntoGrenade() {
        IfWinExist BlueStacks App Player
            WinActivate
        MouseMove 154, 614
        MouseClickDrag, Left, 154, 614, 154, 404, 80
        sleep 2000
    }

    Heal() {
        click 1670, 420 ;heal
        sleep 8200
    }
}