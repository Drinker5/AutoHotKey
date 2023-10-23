#Requires AutoHotkey v2.0

#Include "../funcs.ahk"

winX := 0
winY := 0
winW := 0
winH := 0
windowName := "Elite - Dangerous"

FindWindow() {
  try {
    WinGetPos(&winX, &winY, &winW, &winH, windowName)
  }
  catch Error as err {
    MsgBox("window: '" windowName "' is not found")
    return
  }

}

ToMenu() {
  SendEvent "{Esc}"
  SendEvent "{Up}"
  SendEvent "{Enter}"
  SendEvent "{Enter}"

  WaitMenuLoading()
}

Login() {
  SendEvent "{Enter}"
  SendEvent "{Right}"
  SendEvent "{Right}"
  SendEvent "{Enter}"

  WaitGameLoading(winW / 2, winH * 0.875)
  Sleep 500
}

WaitMenuLoading() {
  WaitGameLoading(0, 0)
}

WaitGameLoading(x, y) {
  Loop {
    color := PixelGetColor(x, y)
    isBlack := color == 0x000000
    if (!isBlack) {
      Log("Loaded")
      return
    }

    Sleep(500)
  }

  Log("FU")
}