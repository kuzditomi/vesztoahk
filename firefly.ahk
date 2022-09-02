#Include %A_ScriptDir%\src\commands.ahk
#Include %A_ScriptDir%\src\screen.ahk
#Include %A_ScriptDir%\src\character.ahk

global gameScreen := new Screen()
global chacter := new Character()

BlowUpMyself(){
    gameScreen.Play()
    chacter.RandomMove()
    chacter.ThrowGrenade()
    chacter.WalkIntoGrenade()
    gameScreen.Result()
}

Ctrl & b::
Loop
{
    BlowUpMyself()
    sleep 4000
}
