//
// Created by Sorin Sebastian Mircea on 02/11/2017.
//


#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <unistd.h>

int main() {
    int socketHandler, clientHandler;
    struct sockaddr_in server, client;
    int clientSize;
    int size;


    //Try to create the socker
    socketHandler = socket(AF_INET, SOCK_STREAM, 0);
    if( socketHandler < 0) {
        printf("Eroare la creare socket-ului server \n");
        return 1;
    }

    //Set server
    memset(&server, 0, sizeof(server));
    server.sin_port = htons(3012);
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;

    //Try to bind the socketHandler to the server
    if( bind(socketHandler, (struct sockaddr *) &server, sizeof(server)) < 0 ) {
        printf("Eroare la bind \n");
        return 1;
    }

    //Listen to connections on the socker (maximum 5)
    listen(socketHandler, 5);

    //Set client
    clientSize = sizeof(client);
    memset(&client, 0, sizeof(client));

    //Accept connections
    while(1) {
        //Accept & wait for a connection
        clientHandler = accept(socketHandler, (struct sockaddr *) &client, &clientSize);
        printf("S-a connectat un client. \n");

        //Receive the string
        char strng[100];
        memset(strng, 0, sizeof(strng));
        char crtChar;
        int pos = 0;
        do {
            recv(clientHandler, &crtChar, sizeof(crtChar), 0);
            strng[pos++] = crtChar;
        }while(crtChar != '\n');

        //Receive the char
        char chr;
        recv(clientHandler, &chr, sizeof(chr), 0);

        //Solve the problem;
        int sizeStrng = strlen(strng);
        int posChr = 0;
        for(int i = sizeStrng - 1; i >=0; i--) {
            if(strng[i] == chr) {
                posChr = i;
                break;
            }
        }

        //Send string
        for(int i = 0; i < posChr; i++) {
            send(clientHandler, &strng[i], sizeof(char), 0);
        }

        //Send new line
        char nl[10];
        memset(nl, 0, sizeof(nl));
        nl[0] = '\n';
        send(clientHandler, &nl, sizeof(char), 0);


        //Close client handler
        close(clientHandler);
    }

}