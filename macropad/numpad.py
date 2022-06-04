from adafruit_hid.keycode import Keycode

app = {
    'name' : 'Numpad',
    'macros' : [
        # 1st row ----------
        (0x202020, '7', ['7']),
        (0x202020, '8', ['8']),
        (0x202020, '9', ['9']),
        # 2nd row ----------
        (0x202020, '4', ['4']),
        (0x202020, '5', ['5']),
        (0x202020, '6', ['6']),
        # 3rd row ----------
        (0x202020, '1', ['1']),
        (0x202020, '2', ['2']),
        (0x202020, '3', ['3']),
        # 4th row ----------
        (0x200020, 'Del', [Keycode.BACKSPACE]),
        (0x202020, '0', ['0']),
        (0x200020, 'Enter', [Keycode.ENTER]),
        # Encoder button ---
        (0x000000, '', [Keycode.BACKSPACE])
    ]
}
