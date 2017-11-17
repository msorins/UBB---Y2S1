//
// Created by Sorin Sebastian Mircea on 09/11/2017.
//

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
    struct sockaddr_in server, client;
    char message[100], message_rev[100];
    int crtMessage = 0;
    u_short lh, ln;
    int lung, i;

    //CREATE SERVER SOCKET
    sd = socket (AF_INET, SOCK_DGRAM, 0);
    printf("socket %d\n", sd);

    //SERVER OPTIONS
    memset ((char *) &server, 0, sizeof (server));
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    server.sin_port = htons (12346);

    //BIND CONNECTIONS
    i = bind (sd, (struct sockaddr *) &server, sizeof (server));

    while(1) {
        printf("Waiting for clients...\n");
        lung = sizeof(client);
        uint32_t lh, ln;
        char chr;
        char chrAux;

        //RECEIVE DATA
        i = recvfrom(sd, (char*)&chr, sizeof(chr), 0, (struct sockaddr *) &client, &lung);
        do {
            i = recvfrom(sd, (char*)&chrAux, sizeof(chr), 0, (struct sockaddr *) &client, &lung);
            message[crtMessage++] = chrAux;

        }while(chrAux != '\n');

        printf("Received msg: %s\n", message);
        //Solve the problem;
        int sizeStrng = crtMessage - 1;
        int posChr = 0;
        for(int j = sizeStrng - 1; j >=0; j--) {

            if(message[j] == chr) {
                posChr = j;
                break;
            }
        }

        printf("Response: ");
        //Send string
        for(int j = 0; j < posChr; j++) {
            i = sendto(sd, &message[j], sizeof(char), 0, (struct sockaddr *) &client, &lung);
            printf("%c", message[j]);
        }
        printf("\n");

        //Send new line
        char nl[10];
        memset(nl, 0, sizeof(nl));
        nl[0] = '\n';
        i = sendto(sd, (char*)&nl, sizeof(char), 0, (struct sockaddr *) &client, &lung);

        close(sd);
        break;
    }
}