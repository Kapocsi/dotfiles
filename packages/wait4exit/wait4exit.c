#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

int main(int argc, char **argv) {
    pid_t ppid, fpid;
    struct kevent kev;
    int kq;
    int kret;
    struct timespec timeout;

    if ( argc > 2 ) {
        fprintf(stderr, "Please quote the command you want to run\n");
        exit(-1);
    }

    ppid = getppid();

    fpid = fork();
    if ( fpid == -1 ) {
        perror("fork");
        exit(-1);
    }

    if ( fpid != 0 ) {
        exit(0);
    }

    EV_SET(&kev, ppid, EVFILT_PROC, EV_ADD, NOTE_EXIT, 0, 0);

    kq = kqueue();
    if ( kq == -1 ) {
        perror("kqueue");
        exit(-1);
    }

    kret = kevent(kq, &kev, 1, NULL, 0, NULL);
    if ( kret == -1 ) {
        perror("kevent");
        exit(-1);
    }

    timeout.tv_sec = ( 8 /*hours*/ * 60 /*minutes per hour*/ * 60 /*seconds per minute*/ );
    timeout.tv_nsec = 0;

    kret = kevent(kq, NULL, 0, &kev, 1, &timeout);
    if ( kret == -1 ) {
        perror("kevent");
        exit(-1);
    }

    if ( kret > 0 ) {
        system(argv[1]);
    }
    /* ( kret == 0 ) means timeout; don't do anything */

    exit(0);
}