#!/usr/bin/env python

import sys
from pathlib import Path
import subprocess as sp
import json as j

with open(f"{Path(__file__).resolve().parent}/pdf_list.json",'r') as f:
    pdf_list=j.load(f)

if len(sys.argv)<2:
    if sys.stdout.isatty(): print("give 'launch' as argument")
    exit()
if sys.stdout.isatty(): print(pdf_list)
menu="\n".join(pdf_list.keys())
match sys.argv[1]:
    case 'launch':
        res=sp.run(['rofi','-dmenu','-msg','pdf','-p','pdf' ]
                   ,input=menu
                   ,capture_output=True
                   ,text=True
               ).stdout.strip()
        if res=='':
            exit()
        else:
            cmd=[
                    'zathura',
                    '--fork',
                    str(Path(pdf_list[res]).expanduser()),
                    ]

            if sys.stdout.isatty(): print(*cmd,sep=' ')

            sp.run(cmd)
            exit()
    case _:
        print(f"invalid arg '{sys.argv[1]}'")
