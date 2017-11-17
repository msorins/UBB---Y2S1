//
// Created by Sorin Sebastian Mircea on 02/11/2017.
//

#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <arpa/inet.h>
#include <unistd.h>

int main() {
    int socketHandler;
    struct sockaddr_in server;

    char myName[100];
    char prob[100];
    char confirm[100];

    memset(myName, 0, sizeof(myName));
    memset(prob, 0, sizeof(prob));
    memset(confirm, 0, sizeof(confirm));

    strcpy(myName, "Sorin\n");
    strcpy(prob, "1\n");

    // ########## CLIENT ##########

    // create the socket (local internet, tcp, 0);
    socketHandler = socket(AF_INET, SOCK_STREAM, 0);
    if( socketHandler < 0 ) {
        printf("Eroare la creare socketului pe client \n");
        return 1;
    }

    //Set the socket
    memset(&server, 0, sizeof(server));
    server.sin_port = htons(54321);
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = inet_addr("172.30.113.3");

    //Connect the socket to the server
    if( connect(socketHandler, (struct sockaddr *) &server, sizeof(server)) < 0 ) {
        printf("Eroare la conectarea la server \n");
        return 1;
    }

    //Receive 1st string
    char crtChar;
    do {
        recv(socketHandler, &crtChar, sizeof(crtChar), 0);
        printf("%c", crtChar);
    }while(crtChar != '\n');

    //Send 1st string
    send(socketHandler, &myName, sizeof(char) * 6, 0);

    //Receive 2nd string
    do {
        recv(socketHandler, &crtChar, sizeof(crtChar), 0);
        printf("%c", crtChar);
    }while(crtChar != '\n');

    //Send 2nd string
    send(socketHandler, &prob, sizeof(char) * 2, 0);

    //Receive 3rd string
    do {
        recv(socketHandler, &crtChar, sizeof(crtChar), 0);
        printf("%c", crtChar);
    }while(crtChar != '\n');


    //Send 3rd number
    send(socketHandler, &confirm, sizeof(char) * 2, 0);

    //Close socket
    close(socketHandler);
}