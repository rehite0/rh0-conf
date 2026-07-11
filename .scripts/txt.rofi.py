#!/usr/bin/env python

import sys
from pathlib import Path
import subprocess as sp
import json as j


if len(sys.argv)<2:
    if sys.stdout.isatty(): print("give 'launch' as argument")
    exit()

txt_path=Path('~/txts').expanduser().resolve()
txt_list=dict()
if not txt_path.is_dir():
    print(f"{txt_path} not found")
for i in txt_path.iterdir():
    if i.is_file():
        txt_list[i.name]=str(i)
if sys.stdout.isatty(): print(txt_list)
menu="\n".join(txt_list.keys())
match sys.argv[1]:
    case 'launch':
        res=sp.run(['rofi','-dmenu','-msg','txt','-p','txt' ]
                   ,input=menu
                   ,capture_output=True
                   ,text=True
               ).stdout.strip()
        if res=='':
            exit()
        else:
            cmd=[
                    'nvim',
                    str(Path(txt_list[res]).expanduser()),
                    ]

            if sys.stdout.isatty(): print(*cmd,sep=' ')

            sp.run(cmd)
            exit()
    case _:
        print(f"invalid arg '{sys.argv[1]}'")
