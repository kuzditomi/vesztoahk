#Include ./src/screen.ahk
#Include ./src/character.ahk

gameScreen := new Screen()
chacter := new Character()

BlowUpMyself(){
    gameScreen.Play()
    chacter.RandomMove()
    chacter.ThrowGrenade()
    chacter.WalkIntoGrenade()
}


Ctrl & b::BlowUpMyself()


