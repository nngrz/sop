#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) {
    int pid, cpid;
    pid = fork();

    printf("Hello world\n");

    if (pid < 0) {
        fprintf(stderr, "Error: new process cannot be created");
        _exit(-1);
    } else if (pid == 0) {
        printf("Child process is executing with pid = %d\n", getpid());
    } else {
        /* parent process*/
        cpid =wait(NULL);
        printf("Child process has been executed with pid = %d\n", cpid);
        printf("Parent process almost has been executed with pid = %d\n", getpid());
        _exit (0);
    }
}
