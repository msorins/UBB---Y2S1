//
// Created by Sorin Sebastian Mircea on 15/11/2017.
//

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
    int sd;
    struct sockaddr_in server;
    uint32_t lh, ln;

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


    //CREATE THE SOCKET
    sd = socket (AF_INET, SOCK_DGRAM, 0);
    memset ((char *) &server, 0, sizeof (server));

    //SERVER OPTIONS
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = inet_addr("127.0.0.1");
    server.sin_port = htons (12345);
    int lung = sizeof(server);

    //Convert ints
    uint32_t nLinkN = htons(nLink);

    //Send to server
    sendto(sd, (int*)&nLink, sizeof(nLink), 0, (struct sockaddr *) &server, sizeof (server));
    sendto(sd, (int*)&link, sizeof(link), 0, (struct sockaddr *) &server, sizeof (server));

    //Receive from server
    uint32_t nResN;
    recvfrom(sd, &nResN, sizeof(nResN), 0, (struct sockaddr *) &server, &lung);
    nRes = ntohs(nResN);
    printf("Res: %d\n", nRes);

    char c;
    for(int i = 0; i < nRes; i++) {
        recvfrom(sd, &c, sizeof(char), 0, (struct sockaddr *) &server, &lung);
        printf("%c", c);
    }


    printf("Req res: \n %s \n", res);
    close(sd);
}
