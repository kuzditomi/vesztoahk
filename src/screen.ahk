Class Screen {
    __New(){
    }

    Play() {
        IfWinExist BlueStacks
            WinActivate
        
        click 1615, 940 ;play gomb
        sleep 20000
    }
}