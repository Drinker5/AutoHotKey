#Requires AutoHotkey v2.0
#SingleInstance Force

#Include "funcs.ahk"

Main() {
	; Send "{F 3}"
	TestKB()
}

TestKB() {

	Log(A_KeyDelay " - A_KeyDelay")
	Log(A_KeyDuration " - A_KeyDuration")
	SetKeyDelay(100, 50)
	Log(A_KeyDelay " - A_KeyDelay")
	Log(A_KeyDuration " - A_KeyDuration")

	Send "{DEL 4}"  ; Presses the Delete key 4 times.

	Loop 3 {
		Send "{Up down}"  ; Press down the up-arrow key.
		Sleep 1000  ; Keep it down for one second.
		Send "{Up up}"  ; Release the up-arrow key.
		Sleep 100
	}

	Loop 3 {
		SendEvent "asdF" ; SetKeyDelay works
		Sleep(100)
	}

	Loop 3 {
		Send "asdF" ; SetKeyDelay not working
		Sleep(100)
	}

}

TestMouse() {
	sleepSec := 1

	Log(A_MouseDelay " - A_MouseDelay")
	SetMouseDelay(1000)
	Log(A_MouseDelay " - A_MouseDelay")
	Loop 3 {
		SendEvent "{Click}" ; SetMouseDelay works
		Sleep(100)
	}

	Loop 3 {
		Log(A_Index)
		Click 2 ; SetMouseDelay not working
		Log(A_Index)
		Sleep(1000)
		Click "Down"
		Sleep(300)
		Click "Up"
		Sleep(sleepSec * 1000)
	}
}