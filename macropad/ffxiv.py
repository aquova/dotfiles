from adafruit_hid.keycode import Keycode

app = {
    'name': 'Final Fantasy XIV',
    'macros': [
        # First Row
        (0x004000, 'MCH', [Keycode.CONTROL, Keycode.SHIFT, Keycode.ALT, '1']),
        (0x004000, 'RDM', [Keycode.CONTROL, Keycode.SHIFT, Keycode.ALT, '2']),
        (0x004000, 'BRD', [Keycode.CONTROL, Keycode.SHIFT, Keycode.ALT, '3']),
        # Second Row
        (0x004000, 'MIN', [Keycode.CONTROL, Keycode.SHIFT, Keycode.ALT, '4']),
        (0x004000, 'BTN', [Keycode.CONTROL, Keycode.ALT, 'Q']),
        (0x004000, 'FSH', [Keycode.CONTROL, Keycode.ALT, 'E']),
        # Third Row
        (0x004000, 'CRP', [Keycode.CONTROL, Keycode.ALT, 'R']),
        (0x004000, 'LTW', [Keycode.CONTROL, Keycode.ALT, 'F']),
        (0x004000, 'GSM', [Keycode.CONTROL, Keycode.ALT, 'Z']),
        # Fourth Row
        (0x004000, 'WVR', [Keycode.CONTROL, Keycode.ALT, 'X']),
        (0x004000, 'ARM', [Keycode.CONTROL, Keycode.ALT, 'C']),
        (0x004000, 'BSM', [Keycode.CONTROL, Keycode.ALT, 'V']),
        # Dial Button
        (0x000000, '', [])
    ]
}
