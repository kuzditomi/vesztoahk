#Include %A_LineFile%\..\debugGui.ahk

class Statistics {
    static totalRunCount := 0
    static totalRuntime := 0
    static latestStartTime := 0
    static winChestCollected := 0
    static killChestCollected := 0

    Start(){
        Statistics.latestStartTime := A_TickCount
        Statistics.totalRunCount := 0
        Statistics.totalRuntime := 0
    }

    RecordRun(){
        Statistics.totalRunCount++
        Statistics.totalRuntime := A_TickCount - Statistics.latestStartTime
    }

    CollectedWinChest() {
        Statistics.winChestCollected++
    }

    CollectedKillChest() {
        Statistics.killChestCollected++
    }

    Stop(){
        averageRuntime := Round(Statistics.totalRuntime / Statistics.totalRunCount / 1000)
        totalRunCount := Statistics.totalRunCount

        winChestCollected := Statistics.winChestCollected
        killChestCollected := Statistics.killChestCollected

        stasticsSummary = 
        (Ltrim
            %totalRunCount% kor teljesitve.
            Az atlagos kor %averageRuntime% masodpercig tartott.
        )

        if(killChestCollected > 0){
            stasticsSummary = 
            (Ltrim
                %stasticsSummary%
                Kill chest kinyitva: %killChestCollected%.
            )
        }

        if(winChestCollected > 0){
            stasticsSummary = 
            (Ltrim
                %stasticsSummary%
                Win chest kinyitva: %winChestCollected%.
            )
        }

        DebugGui.Write(stasticsSummary)

        MsgBox, 4096, Alert, % stasticsSummary
    }
}