#Include %A_LineFile%\..\statistics.ahk

#z::
    Statistics.Stop()
    Pause    

^!p::
    Pause    

#y::
    Statistics.Start()
    Reload

Ctrl & q::
    Statistics.Stop()
    ExitApp
