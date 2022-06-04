from adafruit_hid.keycode import Keycode

app = {
    'name': 'Visual Studio Code',
    'macros': [
        # First Row
        (0x000040, 'Debug', [Keycode.F5]),
        (0x000040, 'Restart', [Keycode.CONTROL, Keycode.SHIFT, Keycode.F5]),
        (0x000040, 'Stop', [Keycode.SHIFT, Keycode.F5]),
        # Second Row
        (0x000040, 'Into', [Keycode.F11]),
        (0x000040, 'Out', [Keycode.SHIFT, Keycode.F11]),
        (0x000040, 'Over', [Keycode.F10]),
        # Third Row
        (0x000040, 'Shell', [Keycode.CONTROL, '`']),
        (0x000040, 'Files', [Keycode.CONTROL, Keycode.SHIFT, 'e']),
        (0x000040, '', []),
        # Fourth Row
        (0x000040, 'Find', [Keycode.CONTROL, Keycode.SHIFT, 'f']),
        (0x000040, 'VC', [Keycode.CONTROL, Keycode.SHIFT, 'g']),
        (0x000040, 'Debug', [Keycode.CONTROL, Keycode.SHIFT, 'd']),
        # Dial Button
        (0x000000, '', [])
    ]
}
