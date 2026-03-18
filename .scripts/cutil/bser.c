
#define bser(ret,k,arr,l,r)				\
do{ while(l<r){						\
	int m=l+(r-l)/2;				\
	if(arr[m]==k){ret=m;break;}			\
	else (arr[m]<k)? r=m:l=m;			\
}ret=-1; }while(0)					\

	
