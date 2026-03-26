
#define map(fn,arr,n)			\
for(int _i=0;_i<n;++_i) fn(arr[_i],_i)	\

#define exist(ret,cond,arr,n)		\
do{ int _i=0;				\
while ( _i<n && !cond )++_i;		\
ret=_i!=n?_i:-1; }while(0)		\

