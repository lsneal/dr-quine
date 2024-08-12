#include <stdio.h>

/*
    YO
*/

void     waw() {
    char    *a="#include <stdio.h>%c%c/*%c    YO%c*/%c%cvoid    waw() {%c%cchar    *a=%c%s%c;%c%cprintf(a, 10, 10, 10, 10, 10, 10, 10, 9, 34, a, 34, 10, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10);%c}%c%cint main() {%c/*%c    YO2%c*/%c    waw();%c}%c";
    printf(a, 10, 10, 10, 10, 10, 10, 10, 9, 34, a, 34, 10, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10);
}

int main() {
/*
    YO2
*/
    waw();
}