#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    int i;
    pid_t pid;

    printf("Parent process (PID: %d)\n", getpid());

    for (i = 0; i < 32; i++) {
        pid = fork();

        if (pid < 0) {
            fprintf(stderr, "Fork failed!\n");
            return 1;
        } else if (pid == 0) {
            printf("Child %d (PID: %d, Parent PID: %d)\n", i, getpid(), getppid());
            sleep(60);
            return 0;
        }
    }

    // Ensures the parent process waits for all child processes to terminate.
    while (wait(NULL) > 0);

    return 0;
}
