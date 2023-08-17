; Move Windows
; Adds keybinds to move application windows in various ways, to match my Linux set up

; Control + Alt + Win + Direction: Move current window to different monitor
^!#Left::Send #+{Left}
^!#Right::Send #+{Right}

; Control + Alt + Enter: Maximize current window
^!Enter::WinMaximize, A

; Control + Alt + C: Center current window
^!C::
    WinGetPos,,, Width, Height, A
    WinMove, A,, (A_ScreenWidth - Width) / 2, (A_ScreenHeight - Height) / 2
    Return

; Control + Alt + Direction: Resize current window to half-screen size
^!Left::WinMove, A,, 0, 0, A_ScreenWidth / 2, A_ScreenHeight
^!Right::WinMove, A,, A_ScreenWidth / 2, 0, A_ScreenWidth / 2, A_ScreenHeight

; Control + Space: Open search
^Space::Send #s
