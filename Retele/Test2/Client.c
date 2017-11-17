//
// Created by Sorin Sebastian Mircea on 09/11/2017.
//

/*
 * Raspuns: Un client trimite unui server un sir de caractere si un caracter C.
 * Serverul returneaza toate caracterele din sir care se afla inainte de ultima aparitie a lui C. Are you satisfied with this problem? [y/n]
 */



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
    char chr;

    //CREATE THE SOCKET
    sd = socket (AF_INET, SOCK_DGRAM, 0);
    memset ((char *) &server, 0, sizeof (server));

    //SERVER OPTIONS
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = inet_addr("127.0.0.1");
    server.sin_port = htons (12346);

    //READ MESSAGE FROM KEYBOARD
    printf("Message: ");
    fgets(message, sizeof(message), stdin);
    lh = strlen(message);
    message[lh] = '\n';
    ln = htons(lh);

    printf("Chr: ");
    scanf("%c", &chr);

    //SEND MESSAGE TO SERVER
    sendto(sd, (char*)&chr, sizeof(chr), 0, (struct sockaddr *) &server, sizeof (server));
    for(int i = 0; i < lh ; i++) {
        sendto(sd, (char*)&message[i], sizeof(chr), 0, (struct sockaddr *) &server, sizeof (server));
        printf("%c-\n", message[i]);
    }


    //RECEIVE MESSAGE FROM SERVER
    do {
        int i = recvfrom(sd, (char*)&chr, sizeof(chr), 0, (struct sockaddr *) &server, sizeof (server));
        if(i != -1)
            printf("%c", chr);
    }while(chr != '\n');

    //CLOSE CONNECTIONS
    close(sd);
}

