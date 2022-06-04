from adafruit_hid.keycode import Keycode

app = {
    'name': 'Discord',
    'macros': [
        # First Row
        (0x200020, '< Server', [Keycode.CONTROL, Keycode.ALT, Keycode.UP_ARROW]),
        (0x200020, 'Up', [Keycode.PAGE_UP]),
        (0x200020, 'Server >', [Keycode.CONTROL, Keycode.ALT, Keycode.DOWN_ARROW]),
        # Second Row
        (0x200020, '< Chan', [Keycode.ALT, Keycode.UP_ARROW]),
        (0x200020, 'Down', [Keycode.PAGE_DOWN]),
        (0x200020, 'Chan >', [Keycode.ALT, Keycode.DOWN_ARROW]),
        # Third Row
        (0x200020, 'Mute', [Keycode.CONTROL, 'M']),
        (0x200020, 'Switcher', [Keycode.CONTROL, 'k']),
        (0x200020, 'Deafen', [Keycode.CONTROL, 'D']),
        # Fourth Row
        (0x200020, 'Emoji', [Keycode.CONTROL, 'e']),
        (0x200020, 'Pins', [Keycode.CONTROL, 'p']),
        (0x200020, 'Search', [Keycode.CONTROL, 'f']),
        # Dial Button
        (0x000000, '', [])
    ]
}
