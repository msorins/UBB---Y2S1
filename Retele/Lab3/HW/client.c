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

    //CREATE THE SOCKET
    sd = socket (AF_INET, SOCK_DGRAM, 0);
    memset ((char *) &server, 0, sizeof (server));

    //SERVER OPTIONS
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = inet_addr("127.0.0.1");
    server.sin_port = htons (12345);

    //READ MESSAGE FROM KEYBOARD
    printf("Message: ");
    fgets(message, sizeof(message), stdin);
    lh = strlen(message);
    ln = htons(lh);

    //SEND MESSAGE TO SERVER
    sendto(sd, (int*)&ln, sizeof(ln), 0, (struct sockaddr *) &server, sizeof (server));
    sendto(sd, (char*)&message, sizeof(message), 0, (struct sockaddr *) &server, sizeof (server));

    //RECEIVE MESSAGE FROM SERVER
    recvfrom(sd, (char*)&message, sizeof(message), 0, (struct sockaddr *) &server, &lh);
    printf("Receive from server: %s\n", message);

    //CLOSE CONNECTIONS
    close(sd);
}
