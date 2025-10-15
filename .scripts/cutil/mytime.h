#pragma once
#include <stdio.h>
#include <time.h>


#define print_t(a,b)\
	do{\
		b.tv_sec=b.tv_sec-a.tv_sec;\
		b.tv_nsec=b.tv_nsec-a.tv_nsec;\
		if(b.tv_nsec<0){b.tv_nsec=1000*1000*1000+b.tv_nsec;b.tv_sec--;}\
		dprintf(1,"sec: %ld\tns:%4ld,%03ld,%03ld\n",b.tv_sec\
				,(b.tv_nsec%1000000000l-b.tv_nsec%1000000l)/1000000l\
				,(b.tv_nsec%1000000l-b.tv_nsec%1000l)/1000l\
				,b.tv_nsec%1000l);\
	}while(0)

struct timespec start,stop;
