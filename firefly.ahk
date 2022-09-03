#SingleInstance, Force

#Include src\screens\gameScreen.ahk
#Include src\screens\mainScreen.ahk
#Include src\character.ahk

global mainScreen := new MainScreen()
global gameScreen := new GameScreen()
global chacter := new Character()

BlowUpMyself(){
    mainScreen.Play()
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

#Include src\commands.ahk
