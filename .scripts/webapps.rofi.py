#!/usr/bin/env python

import sys
from pathlib import Path
import subprocess as sp
import json as j

with open(f"{Path(__file__).resolve().parent}/webapps_list.json",'r') as f:
    webapps_list=j.load(f)

if len(sys.argv)<2:
    if sys.stdout.isatty(): print("give 'launch' as argument")
    exit()
print(webapps_list)
menu="\n".join(webapps_list.keys())
match sys.argv[1]:
    case 'launch':
        res=sp.run(['rofi','-dmenu','-msg','webapps','-p','web' ]
                   ,input=menu
                   ,capture_output=True
                   ,text=True
               ).stdout.strip()
        if res=='':
            exit()
        else:
            cmd=[
                    'flatpak','run','com.vivaldi.Vivaldi',
                    f'--profile-directory="{webapps_list[res]["profile"]}"',
                    ]
            if webapps_list[res]['app_mode']:
                cmd.append(f'--app={webapps_list[res]["url"]}')
            else:
                cmd.append(webapps_list[res]["url"])

            if sys.stdout.isatty(): print(*cmd,sep=' ')

            sp.run(" ".join(cmd),shell=True)
            sp.run([__file__,'launch'])
            exit()
    case _:
        print(f"invalid arg '{sys.argv[1]}'")

