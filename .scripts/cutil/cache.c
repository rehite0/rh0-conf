#if 0
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

#define MAX_SIZE 512
#define hash(k) (k^0x6098bbe4)
// gcc -E
#endif

#define CACHE_VTYPE int
#define CACHE_KTYPE int

CACHE_KTYPE itable[MAX_SIZE]={0};
CACHE_VTYPE otable[MAX_SIZE]={0};
CACHE_VTYPE get_cache(CACHE_KTYPE k);
void set_cache(CACHE_KTYPE k,CACHE_VTYPE v);


CACHE_VTYPE get_cache(CACHE_KTYPE k){
	assert(k!=0);
	int idx=hash(k)%MAX_SIZE;
	return itable[idx]==k?otable[idx]:0;
}
void set_cache(CACHE_KTYPE k,CACHE_VTYPE v){
	assert(k!=0);
	int idx=hash(k)%MAX_SIZE;
	itable[idx]=k;
	otable[idx]=v;
}
