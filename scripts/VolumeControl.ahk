; Volume Control Keybindings
; aquova, 2020

; Sets PrintScreen to Mute, Scroll Lock to volumn down, and Pause to volume up

*ScrollLock::
    Send {Volume_Down}
    Return
*Pause::
    Send {Volume_Up}
    Return
*PrintScreen::
    Send {Volume_Mute}
    Return
