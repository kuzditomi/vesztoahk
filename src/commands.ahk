#Include %A_LineFile%\..\statistics.ahk

^p::
    Pause    
Return

#z::
    Statistics.Stop()
    Pause    

#y::
    Statistics.Start()
    Reload

Ctrl & q::
    Statistics.Stop()
    ExitApp
