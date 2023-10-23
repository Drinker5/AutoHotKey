#Requires AutoHotkey v2.0

Log(line) {
  OutputDebug(line "`n")
}

!1:: {  ; Alt+1 Run
  Main()
}

#SuspendExempt
!2:: { ; Alt+2  Stop/Resume
  Suspend(-1) ; toggle
  Pause(-1) 	; toggle
}
#SuspendExempt false

!3:: { ; Alt+3 Exit
  ExitApp
}

!4:: {
  Loop 10 {
    color := PixelGetColor(0, 0)
    Log(color)
    Sleep 1000
  }
}