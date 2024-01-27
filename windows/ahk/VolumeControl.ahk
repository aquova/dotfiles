; Volume Control Keybindings

; Changes default volume change value to be +/- 5, rather than 2
; Note that this doesn't block the native Windows command, so we still see the prompt
; This thus performs the extra +/- 3 adjustment to reach 5.

~Volume_Up::
    SoundSet, +3
    SoundPlay *16
    Return
~Volume_Down::
    SoundSet, -3
    SoundPlay *16
    Return
