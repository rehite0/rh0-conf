//
#define __USE_MINGW_ANSI_STDIO 0
#include <stdio.h>

void solve()
{
	int n ;
	scanf("%d",&n);
	return;
}
int main()
{
	int t;
	scanf("%d",&t); if(t==0) return 0;
	do{ solve(); }while(--t);
}
