#Include %A_LineFile%\..\statistics.ahk

#z::
    Statistics.Stop()
    Pause    

#y::
    Statistics.Start()
    Reload

Ctrl & q::
    Statistics.Stop()
    ExitApp
