//
// Created by Sorin Sebastian Mircea on 19/10/2017.
//

#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>

main() {
    int sd;
    struct sockaddr_in server;
    char mesaj[100];
    u_short lh, ln;
    int i;
    sd = socket (AF_INET, SOCK_DGRAM, 0);
    printf("socket %d\n", sd);
    memset ((char *) &server, 0, sizeof (server));

    server.sin_family = AF_INET;
    server.sin_addr.s_addr = inet_addr("127.0.0.1");
    server.sin_port = htons (12345);

    lh = strlen(mesaj);
    ln = htons(lh);
    int lung = sizeof(server);

    printf("Dati mesajlu: ");
    fgets(mesaj, sizeof(mesaj), stdin);
    i = sendto(sd, (char*)&mesaj, sizeof(mesaj), 0, (struct sockaddr *) &server, sizeof (server));

    i = recvfrom(sd, (char*)&mesaj, sizeof(mesaj), 0, (struct sockaddr *) &server, &lung);
    printf("recvfrom %s\n", mesaj);

    close(sd);
}
