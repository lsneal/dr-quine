#include <stdio.h>
#include <fcntl.h>

#define CALL_MAIN int main() { FILE *fptr; fptr = fopen("Grace_kid.c", "w"); PRINTF(fptr, STRINGS); fclose(fptr); return (0); }
#define PRINTF(fptr, a) fprintf(fptr, a, 10, 10, 10, 34, 34, 34, 34, 10, 10, 34, a, 34, 10, 10)
#define STRINGS "#include <stdio.h>%c#include <fcntl.h>%c%c#define CALL_MAIN int main() { FILE *fptr; fptr = fopen(%cGrace_kid.c%c, %cw%c); PRINTF(fptr, STRINGS); fclose(fptr); return (0); }%c#define PRINTF(fptr, a) fprintf(fptr, a, 10, 10, 10, 34, 34, 34, 34, 10, 10, 34, a, 34, 10, 10)%c#define STRINGS %c%s%c%c%cCALL_MAIN"

CALL_MAIN