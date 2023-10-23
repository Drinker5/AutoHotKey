#Requires AutoHotkey v2.0
#SingleInstance Force

#Include "base.ahk"

scanTime := 6500

Main() {
  SetMouseDelay(100)
  SetKeyDelay(200, 100)

  FindWindow()

  loop 20 {
    Log(A_Index ": Start")

    ; in game
    StartScan()
    ScanProcedure()
    ToMenu()

    ; in menu
    Login()
  }

  ToMenu()
}

StartScan() {
  SendEvent "u"
  Sleep 4000 ; scan deploying
}

ScanProcedure() {
  ScanOne()
  MoveRight(800)
  ScanOne()
  MoveRight(600)
  ScanOne()
  MoveRight(500)
  ScanOne()
}

ScanOne() {
  SendEvent "{Click Right Down}"
  Sleep scanTime
  SendEvent "{Click Right Up}"
}

MoveRight(time) {
  Send "{Right down}"
  Sleep time
  Send "{Right up}"
  Sleep 300
}