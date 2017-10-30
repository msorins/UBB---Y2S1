//
// Created by Sorin Sebastian Mircea on 24/10/2017.
//


#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
#include <unistd.h>

void main() {
    int sd;
    struct sockaddr_in server;
    char message[100];
    uint32_t lh, ln;

    sd = socket (AF_INET, SOCK_DGRAM, 0);
    memset ((char *) &server, 0, sizeof (server));

    server.sin_family = AF_INET;
    server.sin_addr.s_addr = inet_addr("127.0.0.1");
    server.sin_port = htons (12345);


    int lung = sizeof(server);

    printf("Message: ");
    fgets(message, sizeof(message), stdin);
    lh = strlen(message);
    ln = htons(lh);

    sendto(sd, (int*)&ln, sizeof(ln), 0, (struct sockaddr *) &server, sizeof (server));
    sendto(sd, (char*)&message, sizeof(message), 0, (struct sockaddr *) &server, sizeof (server));

    recvfrom(sd, (char*)&message, sizeof(message), 0, (struct sockaddr *) &server, &lh);
    printf("Receive from server: %s\n", message);

    close(sd);
}
