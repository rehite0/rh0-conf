import vim
import subprocess as sp

def fpipe(cmd="cat",mod='s'):
    file=vim.current.buffer[:]
    line=vim.current.line[:]
    select=vim.current.range[:]

    file='\n'.join(file)
    select='\n'.join(select)

    opt={
            's':select
            ,'f':file
            ,'l':line
    }

    if mod in opt:
        op=sp.run(cmd,input=opt[mod].encode(),shell=True,capture_output=True,timeout=5)
    else:
        print("wrong mode!!")
        return;

    print(op.stdout.decode())
    print("\n\n")
    print(op.stderr.decode())
    # print("file:",file)
    # print("line:",line)
    # print("range:",select)

def prun(mod='s'):
    fpipe("python",mod)
def crun():
    fpipe("gcc -x c -o /tmp/a.out  - ;/tmp/a.out",'f')
