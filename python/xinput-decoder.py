#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# source : http://goo.gl/nLgEv
import re, sys
from subprocess import *

def get_keymap():
    keymap = {}
    table = Popen(['xmodmap', '-pke'], stdout=PIPE).stdout
    for line in table:
        m = re.match('keycode +(\d+) = (.+)', line.decode())
        if m and m.groups()[1]:
            keymap[m.groups()[0]] = m.groups()[1].split()[0]
    return keymap

if __name__ == '__main__':
    keymap = get_keymap();
    for line in sys.stdin:
        m = re.match('key press +(\d+)', line.decode())
        if m:
            keycode = m.groups()[0]
            if keycode in keymap:
                print keymap[keycode],
            else:
                print '?' + keycode,
