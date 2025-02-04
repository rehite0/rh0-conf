import vim
import os
import sys

cmd=vim.command
def vbuff(b=-1):
    if b==-1:
        return vim.current.buffer
    elif b==0:
        print(list(vim.buffers))
    elif b in vim.buffers:
        vim.current.buffer=vim.buffer[b]

def vpos(r=0,c=0):
    if r==c==0:
        return vim.current.window.cursor
    else:
        vim.current.window.cursor=(r,c-1)



"""
window
:wincmd
whichkey
fzf
floaterm
undotree
cellolar-automata
alpha-nvim
lualine

"""
