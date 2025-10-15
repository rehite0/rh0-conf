//
#define __USE_MINGW_ANSI_STDIO 0
#include <stdio.h>
#include <unistd.h>
#include <mytime.h>

int main(){
	clock_gettime(CLOCK_MONOTONIC, &start);
	printf("hi\n");
	// fprintf(stdout,"hi\n");
	// puts("hi\n");
	// putc('h',stdout); putc('i',stdout); putc('\n',stdout);
	// putc_unlocked('h',stdout); putc_unlocked('i',stdout); putc_unlocked('\n',stdout);
	// dprintf(1,"hi\n");
	// write(1,"hi\n",3);
	clock_gettime(CLOCK_MONOTONIC, &stop);
	print_t(start,stop);
	return 0;
}
