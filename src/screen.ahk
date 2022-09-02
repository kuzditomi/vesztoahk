Class Screen {
    Play() {
        IfWinExist BlueStacks App Player
            WinActivate
        
        MouseGetPos, xpos, ypos
        click 1615, 940 ;play gomb
        sleep 20000
    }

    Result() {
        sleep 3000
        click 235, 956 ;results
        sleep 4000
        send {esc}
    }
}