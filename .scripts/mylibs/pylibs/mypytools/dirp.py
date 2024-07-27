delim="-"*60
def dirp(*args,col=3):
    
    for i in args:
        print(i)
        print(delim)
        l=dir(i)
        for j,k in enumerate(l):
            print(k,end=" "*(20-len(k)))
            if (j+1)%col==0:
                print()

        print("\n",delim)


def docp(*args):
    for i in args:
        try:
            print(i.__doc__)
        except:
            print(f"NO DOC FOR '{i}'")
        print(delim)


