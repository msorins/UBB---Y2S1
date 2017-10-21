//
// Created by Sorin Sebastian Mircea on 17/10/2017.
//

#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

int main(int argc, char **argv) {
    int c;
    struct sockaddr_in server;
    char link[100], res[100000];
    int nLink, nRes;

    //Check if the number of arguments is valid
    if(argc != 2) {
        perror("Invalid nr of arguments");
    }

    //Get the link that must be sent
    strcpy(link, argv[1]);
    nLink = strlen(link);
    link[nLink] = '\0';
    nLink++;

    //Create a socket
    c = socket(AF_INET, SOCK_STREAM, 0);
    if (c < 0) {
        printf("Eroare la crearea socketului client\n");
        return 1;
    }

    //Put server details
    memset(&server, 0, sizeof(server));
    server.sin_port = htons(1245);
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = inet_addr("127.0.0.1");

    //Try to connect to server
    if (connect(c, (struct sockaddr *) &server, sizeof(server)) < 0) {
        printf("Eroare la conectarea la server\n");
        return 1;
    }

    //Convert ints
    uint32_t nLinkN = htons(nLink);

    //Send to server
    send(c, &nLinkN, sizeof(nLinkN), 0);
    send(c, &link, sizeof(char) * nLink, 0);

    //Receive from server
    uint32_t nResN;
    recv(c, &nResN, sizeof(nResN), 0);
    nRes = ntohs(nResN);
    recv(c, &res, sizeof(char) * nRes, 0);

    printf("Req res: \n %s \n", res);
    close(c);
}
