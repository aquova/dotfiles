; AutoHotKey Script to mimick the 'Dvorak-Qwerty-Command' option on Mac
; Dvorak is toggled via right control

SendMode Input
#NoEnv
Menu, Tray, Icon, main.cpl, 8

;----------- REMAP TO DVORAK

-::[
=::]

q::'
w::,
e::.
r::p
t::y
y::f
u::g
i::c
o::r
p::l
[::/
]::=
;\::\ ;no change

;a::a ;no change
s::o
d::e
f::u
g::i
h::d
j::h
k::t
l::n
SC027::s
SC028::-

z::SC027
x::q
c::j
v::k
b::x
n::b
m::m
,::w
.::v
/::z


;----------- RELEASE KEYS FROM REMAP WHEN MODIFIER DOWN

*LCtrl::
SetKeyDelay -1
Send {Blind}{Ctrl DownTemp}
Suspend On
return
*LCtrl up::
Suspend Off
SetKeyDelay -1
Send {Blind}{Ctrl Up}
return

*Alt::
SetKeyDelay -1
Send {Blind}{Alt DownTemp}
Suspend On
return
*Alt up::
Suspend Off
SetKeyDelay -1
Send {Blind}{Alt Up}
return

*LWin::
SetKeyDelay -1
Send {Blind}{LWin DownTemp}
Suspend On
return
*LWin up::
Suspend Off
SetKeyDelay -1
Send {Blind}{LWin Up}
return

;----------- TOGGLE DVORAK-QWERTY WITH RIGHT WINDOWS KEY

*RCtrl::
Suspend, Permit
Suspend, toggle
Hotkey, *LCtrl, toggle
Hotkey, *LCtrl up, toggle
Hotkey, *Alt, toggle
Hotkey, *Alt up, toggle
Hotkey, *LWin, toggle
Hotkey, *LWin up, toggle
return
