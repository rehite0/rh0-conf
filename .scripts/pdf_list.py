#!/usr/bin/env python
base="/home/rh0/doc"
app=('zathura','--fork')
format='pdf'
pdf=[
    ('gdb'  ,f"{base}/gdb.pdf"),
    ('postgress'    ,f"{base}/postgresql-18-A4.pdf"),
    ('c23'  ,f"{base}/c23_std.pdf"),
    ('glibc'    ,f"{base}/glibc.pdf"),
    ('glsl_spec'    ,f"{base}/GLSLangSpec.4.60.pdf"),
    ('x86_manual'   ,f"{base}/intel_x86/325462-088-sdm-vol-1-2abcd-3abcd-4.pdf"),
    ('x86_64-abi'   ,f"{base}/x86_64-abi-0.99.pdf"),

    ('taocp_1'  ,f"{base}/books/taocp_1.pdf"),
    ('taocp_2'  ,f"{base}/books/taocp_2.pdf"),
    ('taocp_3'  ,f"{base}/books/taocp_3.pdf"),
    ('taocp_4'  ,f"{base}/books/taocp_4.pdf"),
    ('spcs'     ,f"{base}/books/Selected_Papers_on_Computer_Science.pdf"),
    ('spcl'     ,f"{base}/books/Selected_papers_on_Computer_language.pdf"),
    ('Structured_Programming'   ,f"{base}/books/Structured_Programming.pdf"),
    ('dragon_book'  ,f"{base}/books/dragon.pdf"),
    ('applied_cryptography' ,f"{base}/books/Applied Cryptography (Bruce Schneier).pdf"),
    ('beej_net_concept' ,f"{base}/books/bgnet_concept.pdf"),
    ('beej_net_programming' ,f"{base}/books/bgnet_programming.pdf"),

    ('af_cpp'   ,f"{base}/AF_optimization_manuals/optimizing_cpp.pdf"),
    ('af_microarchitecture' ,f"{base}/AF_optimization_manuals/microarchitecture.pdf"),
    ('af_calling_convention'    ,f"{base}/AF_optimization_manuals/calling_conventions.pdf"),
    ('af_asm'   ,f"{base}/AF_optimization_manuals/optimizing_assembly.pdf"),
]
pdf=list(map(lambda a:(format,a[0],app,a[1]),pdf))
if __name__=='__main__':
    print(*pdf,sep='\n')
