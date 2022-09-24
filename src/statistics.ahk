#Include %A_LineFile%\..\debugGui.ahk

class Statistics {
    static totalRunCount := 0
    static totalRuntime := 0
    static latestStartTime := 0

    Start(){
        Statistics.latestStartTime := A_TickCount
        Statistics.totalRunCount := 0
        Statistics.totalRuntime := 0
    }

    RecordRun(){
        Statistics.totalRunCount++
        Statistics.totalRuntime := A_TickCount - Statistics.latestStartTime
    }

    Stop(){
        averageRuntime := Round(Statistics.totalRuntime / Statistics.totalRunCount / 1000)
        totalRunCount := Statistics.totalRunCount

        debugMessage = 
        (Ltrim
            %totalRunCount% kor teljesitve.
            Az atlagos kor %averageRuntime% masodpercig tartott.
        )

        DebugGui.Write(debugMessage)

        MsgBox, 4096, Alert, Ennyi!
    }
}