#Include %A_LineFile%\..\statistics.ahk

Ctrl & z::
    Statistics.Stop()
    Pause    

Ctrl & y::
    Statistics.Start()
    Reload

Ctrl & q::
    Statistics.Stop()
    ExitApp
