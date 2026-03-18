
#define map(fn,arr,n)			\
for(int i=0;i<n;++i) fn(arr[i],i)	\

#define exist(ret,cond,arr,n)		\
do{ typeof(arr[0]) x; int i=0		\
while ( i<n && !cond )++i;		\
ret=i!=n?i:-1; }while(0)		\

