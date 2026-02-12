//https://codeforces.com/blog/entry/47180
//https://codeforces.com/blog/entry/121114?#comment-1170588:~:text=I%20believe%20something,does%20not%20matter).
#define __USE_MINGW_ANSI_STDIO 0
#include <stdio.h>
int main() {
    char s[2];
    for (int i = 0; i < 1000000; i++) {
        char ch = (char)('a' + i % 26);
        printf("%c", ch);
        //putchar(ch);
        //sprintf(s,"%c",ch);
        //s[0]=ch;s[1]=0;
        //fputs(s,stdout);
    }
    return 0;
}
