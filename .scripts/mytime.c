#include <mytime.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main(int argc, char** argv){
	if(argc!=2) {dprintf(2,"wrong use\n");exit(1);}
	pid_t pid;
	clock_gettime(CLOCK_MONOTONIC, &start);
	if((pid=fork())==0){
		execv(argv[1],argv+1);
		dprintf(2,"failed to exec:%s\n",argv[1]);
	}
	else waitpid(pid,NULL,0);
	clock_gettime(CLOCK_MONOTONIC, &stop);
	print_t(start, stop);
}
