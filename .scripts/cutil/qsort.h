//qsort(arr,n,size,fn);
int int_asc(const void* a, const void* b){ return ( *(int*)a ) - ( *(int*)b ) ; }

int int_dsc(const void* a, const void* b){ return ( *(int*)b ) - ( *(int*)a ) ; }

int ll_asc(const void* a, const void* b){ long long x= ( *(long long*)a ) - ( *(long long*)b ) ;
					return (x>0)?1:(x==0)?0:-1; }

int ll_dsc(const void* a, const void* b){ long long x= ( *(long long*)b ) - ( *(long long*)a ) ;
					return (x>0)?1:(x==0)?0:-1; }

int char_asc(const void* a, const void* b){ return (int)( *(char*)a ) - ( *(char*)b ) ; }

int char_dsc(const void* a, const void* b){ return (int)( *(char*)b ) - ( *(char*)a ) ; }
