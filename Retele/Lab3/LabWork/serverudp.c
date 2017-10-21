//
// Created by Sorin Sebastian Mircea on 19/10/2017.
//

#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
#include <unistd.h>

main() {
    int sd;
    struct sockaddr_in server, client;
    char mesaj[100];
    u_short lh, ln;
    int lung, i;
    sd = socket (AF_INET, SOCK_DGRAM, 0);
    printf("socket %d\n", sd);
    memset ((char *) &server, 0, sizeof (server));

    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    server.sin_port = htons (12345);

    i = bind (sd, (struct sockaddr *) &server, sizeof (server));

    while(1) {
        printf("Waiting for clients...\n");
        lung = sizeof(client);
        i = recvfrom(sd, (char*)&mesaj, sizeof(mesaj), 0, (struct sockaddr *) &client, &lung);
        printf("recvfrom %s\n", mesaj);

        printf("Dati mesajlu: ");
        fgets(mesaj, sizeof(mesaj), stdin);
        i = sendto(sd, (char*)&mesaj, sizeof(mesaj), 0, (struct sockaddr *) &client, sizeof (client));
    }

    close(sd);
}