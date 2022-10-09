
class MyBaseClass {
    WriteDebug(message) {
        DebugGui.Write(message)
    }

    ScaleX(x) {
        ; Az eredeti X,Y a fullkepernyos Bluestacks alapjan volt
        ; Ebben volt bal oldalt 50px fekete
        return (x-50)/2
    }

     ScaleY(y) {
        ; Az eredeti X,Y a fullkepernyos Bluestacks alapjan volt
        ; Ebben volt bal oldalt 50px fekete
        return (y-33)/2 + 33
    }

    Click(x, y) {
        ; DebugGui.Hide()
        newX := this.ScaleX(x)
        newY := this.ScaleY(y)
        click %newX%, %newY%
        ; DebugGui.Show()
        ; click x,y
    }

    Move(x, y) {
        ; Az eredeti X,Y a fullkepernyos Bluestacks alapjan volt
        ; Ebben volt bal oldalt 50px fekete
        ; És 33 px felső sáv, ami megmarad 
        ; DebugGui.Hide()
        MouseMove ((x-50)/2), ((y-33)/2)+33
        ; DebugGui.Show()
    }
}
