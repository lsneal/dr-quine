#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
int i = 5;
int main(void) {
if (!access("Sully_5.c", F_OK))
    i--;

FILE *fptr;
char sully[15] = {0};
char exec_name[15] = {0};
sprintf(sully, "Sully_%d.c", i);
sprintf(exec_name, "Sully_%d", i);
fptr = fopen(sully, "w");

char *f = "#include <stdio.h>%c#include <fcntl.h>%c#include <stdlib.h>%c#include <string.h>%c#include <unistd.h>%cint i = %d;%cint main(void) {%cif (!access(%cSully_5.c%c, F_OK))%c    i--;%c%cFILE *fptr;%cchar sully[15] = {0};%cchar exec_name[15] = {0};%csprintf(sully, %cSully_%%d.c%c, i);%csprintf(exec_name, %cSully_%%d%c, i);%cfptr = fopen(sully, %cw%c);%c%cchar *f = %c%s%c;%cfprintf(fptr, f, 10, 10, 10, 10, 10, i, 10, 10, 34, 34, 10, 10, 10, 10, 10, 10, 34, 34, 10, 34, 34, 10, 34, 34, 10, 10, 34, f, 34, 10, 10, 10, 34, 34, 10);%cchar cmd[100] = {0};if (i == 0) return (0);%csprintf(cmd, %cgcc %%s -o %%s && ./%%s%c, sully, exec_name, exec_name);%cfclose(fptr); system(cmd); return(0);}";
fprintf(fptr, f, 10, 10, 10, 10, 10, i, 10, 10, 34, 34, 10, 10, 10, 10, 10, 10, 34, 34, 10, 34, 34, 10, 34, 34, 10, 10, 34, f, 34, 10, 10, 10, 34, 34, 10);
char cmd[100] = {0};if (i == 0) return (0);
sprintf(cmd, "gcc %s -o %s && ./%s", sully, exec_name, exec_name);
fclose(fptr); system(cmd); return(0);}