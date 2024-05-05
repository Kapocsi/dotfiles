#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

int main(int argc, char **argv) {
    int ppid = getppid();
    int fpid;
    
    if ( argc != 2 ) {
        fprintf(stderr, "Please quote the command you want to run\n");
        exit(-1);
    }
    fpid = fork();
    if ( fpid == -1 ) {
        perror("fork");
        exit(-1);
    }

    // Exit the initial fork
    if ( fpid != 0 ) {
        exit(0);
    }

    int timeout = 3600 * 60 * 8;
    while ((ppid = getppid()) != 1 && timeout > 1) {
        timeout--;
        sleep(1);
    }

    if (timeout == 0 ) {
        exit(0);
    }

    system(argv[1]);

}
