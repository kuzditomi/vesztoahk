#SingleInstance, Force

#Include src\screens\gameScreen.ahk
#Include src\screens\mainScreen.ahk
#Include src\characters\firefly.ahk

global mainScreen := new MainScreen()
global gameScreen := new GameScreen()
global firefly := new FireFly()

BlowUpMyself(){
    mainScreen.Play()
    gameScreen.WaitForGameStart()
    firefly.RandomMove()
    firefly.ThrowGrenade()
    firefly.WalkIntoGrenade()
    gameScreen.Result()
    mainScreen.ClosePopupsAfterMatch()
}

Ctrl & b::
firefly.Introduction()
Loop
{
    BlowUpMyself()
    sleep 4000
}

#Include src\commands.ahk
