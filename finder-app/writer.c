#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <errno.h>

void main(int argc, char *argv[]) {

    if (argc <3) {
        //printf("%s\n", "Missing filepath and/or string to write. Exiting");
        syslog(LOG_ERR, "Missing filepath and/or string to write. Exiting");
        exit(1);
    } else {
        FILE *fp = fopen(argv[1], "w");
        if (fp == NULL) {
            fprintf(stderr, "Unable to open %s for writing. Exiting",argv[1] );
            syslog(LOG_ERR, "Unable to open file for writing. Exiting");
            exit(2);
        }
        else {
            fprintf(fp, "%s", argv[2]);
            syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
            fclose(fp);
            exit(0);
        }
    }
}
