#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    execlp("/bin/ls", "ls", NULL);
    printf("Hello world - but this text never appear on any console\n");
    printf("If so, it means that execlp execution was not successfully ended\n");
}
