#!/usr/bin/env python

app=('qutebrowser')
format='Web'
url=[
    ('bithacks','https://graphics.stanford.edu/~seander/bithacks.html')
    ('postgres','https://www.postgresql.org/docs/current/index.html')
    ('git','https://git-scm.com/docs')
    ('archwiki','https://wiki.archlinux.org/title/Main_page')
    ('arch_man','https://man.archlinux.org')
    ('gentoo_wiki','https://wiki.gentoo.org/wiki/Main_Page')
    ('gdb','https://sourceware.org/gdb/current/onlinedocs/gdb.html')
    ('python','https://docs.python.org/3/')
    ('man','https://man7.org/linux/man-pages/index.html')
    ('x86_opcode','http://ref.x86asm.net/coder64-abc.html')
    ('gcc','https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/')
    ('blender','https://docs.blender.org/manual/en/latest/')
    ('cffi','https://cffi.readthedocs.io/en/stable/')
    ('magick_doc','https://imagemagick.org/script/command-line-processing.php')
]

url=list(map(lambda a:(format,a[0],app,a[1])))
if __name__=='__main__':
    print(*url,sep='\n')
