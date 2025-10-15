#include <stdio.h>
#include <stdlib.h>
#include "qsort.h"
#include <mytime.h>

#define N 100000

void int_asc_tst();
void ll_asc_tst();
void char_asc_tst();

int main(){
	clock_gettime(CLOCK_MONOTONIC,&start);
	for(int i=0;i<100;i++) {
		char_asc_tst();
	}
	clock_gettime(CLOCK_MONOTONIC,&stop);
	print_t(start, stop);
}
void int_asc_tst(){
	int arr[N],f=1;
	for(int i=0;i<N;++i)
		arr[i]=rand();
	qsort(arr,N,sizeof(int),int_asc);
	for(int i=1;i<N;++i)
		if(arr[i]<arr[i-1]) f=0;
	// for(int i=0;i<N;++i)
	// 	printf("%d ",arr[i]);
	// printf("\n");
	if(f) printf("True\n");
	else printf("False\n");
}
void ll_asc_tst(){
	long long arr[N];
	int f=1;
	for(int i=0;i<N;++i)
		arr[i]=(long long)rand();
	qsort(arr,N,sizeof(long long),ll_asc);
	for(int i=1;i<N;++i)
		if(arr[i]<arr[i-1]) f=0;
	// for(int i=0;i<N;++i)
	// 	printf("%lld ",arr[i]);
	// printf("\n");
	if(f) printf("True\n");
	else printf("False\n");
}
void char_asc_tst(){
	char arr[N],f=1;
	for(int i=0;i<N;++i)
		arr[i]=(char)rand();
	qsort(arr,N,sizeof(char),char_asc);
	for(int i=1;i<N;++i)
		if(arr[i]<arr[i-1]) f=0;
	// for(int i=0;i<N;++i)
	// 	printf("%c ",arr[i]);
	// printf("\n");
	if(f) printf("True\n");
	else printf("False\n");
}
