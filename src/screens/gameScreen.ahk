#Include %A_LineFile%\..\screenBase.ahk

class GameScreen extends ScreenBase {
    Result() {
        sleep 3000
        click 235, 956 ;results
        sleep 1000
        send {esc}
    }

    WaitForGameStart() {
     ;   While !base.HasTextInRect("STARTS", [510, 970, 100, 45]) 
       loop 30 {
        mousemove 510, 970
         tooltip Keresem a Start feliratot
         sleep 1000
         tooltip
        if !base.HasTextInRect("STARTS", [510, 970, 100, 45])
       
            sleep 1000
        Else
        break
        }

        if base.HasTextInRect("STARTS", [510, 970, 100, 45])
        sleep 8000

    }


}