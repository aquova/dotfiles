from adafruit_hid.keycode import Keycode
from adafruit_hid.consumer_control_code import ConsumerControlCode

app = {
    'name' : 'Firefox',
    'macros' : [
        # 1st row ----------
        (0x400000, '< Back', [Keycode.CONTROL, '[']),
        (0x400000, 'Up', [Keycode.SHIFT, ' ']),
        (0x400000, 'Fwd >', [Keycode.CONTROL, ']']),
        # 2nd row ----------
        (0x400000, '< Tab', [Keycode.CONTROL, Keycode.SHIFT, Keycode.TAB]),
        (0x400000, 'Down', ' '),
        (0x400000, 'Tab >', [Keycode.CONTROL, Keycode.TAB]),
        # 3rd row ----------
        (0x400000, 'New', [Keycode.CONTROL, 't']),
        (0x400000, 'Reload', [Keycode.CONTROL, 'r']),
        (0x400000, 'Close', [Keycode.CONTROL, 'w']),
        # 4th row ----------
        (0x400000, 'History', [Keycode.CONTROL, 'h']),
        (0x400000, '>/||', [[ConsumerControlCode.PLAY_PAUSE]]),
        (0x400000, 'Private', [Keycode.CONTROL, 'P']),
        # Encoder button ---
        (0x000000, '', [Keycode.F12]) # Dev
    ]
}
