//
#define __USE_MINGW_ANSI_STDIO 0
#include <stdio.h>

int t,n ;

void solve()
{
	scanf("%d",&n);
	return;
}
int main()
{
	scanf("%d",&t); if(t==0) return 0;
	do{ solve(); }while(--t);
}
