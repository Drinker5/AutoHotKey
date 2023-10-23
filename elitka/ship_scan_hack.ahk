#Requires AutoHotkey v2.0
#SingleInstance Force

#Include "base.ahk"

scanTime := 3000
hackTime := 13000
dronFlightTime := 11000
Main() {
  SetMouseDelay(100)
  SetKeyDelay(200, 100)

  FindWindow()
  Loop 10 {
    Log(A_Index ": Start")
    ; in game
    Scan() ; ship
    Sleep 2300
    Scan() ; radar
    Hack()
    ToMenu()

    ; in menu
    Login()
  }

  Sleep 1000
  ToMenu()
}

Scan() {
  SendEvent "t"
  SendEvent "{Click Left Down}"
  Sleep scanTime
  SendEvent "{Click Left Up}"
}

Hack() {
  SendEvent "y"
  SendEvent "{Click Right}"
  Sleep dronFlightTime ; drone flight time
  Sleep hackTime
  Log "Hacked"
}