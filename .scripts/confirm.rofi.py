#!/usr/bin/env python

import sys
import subprocess as sp
yes_sym='y'
no_sym='n'

opt=[yes_sym,no_sym]
menu="\n".join(opt)
match sys.argv[1]:
    case '':
        print('n')
    case 'launch':
        res=sp.run(['rofi','-dmenu','-msg','confirm','-p','','-theme-str','listview {columns:2;lines:1;}' ]
                   ,input=menu
                   ,capture_output=True
                   ,text=True
               ).stdout.strip()
        print('y' if res==yes_sym else 'n')
    case _:
        print(f"invalid arg {sys.argv[0]}")

