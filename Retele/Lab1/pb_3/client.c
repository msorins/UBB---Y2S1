//
// Created by Sorin Sebastian Mircea on 05/10/2017.
// A client sends to the server a string.
// The server returns the reversed string to the client
// (characters from the end to begging)
//

#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>


int main() {
    int socketHandler;
    struct sockaddr_in server;
    char init[100], res[100];
    int initConverted[100], resConverted[100];
    memset(init, 0, sizeof(init));
    memset(res, 0, sizeof(res));

    // create the socket (local internet, tcp, 0);
    socketHandler = socket(AF_INET, SOCK_STREAM, 0);
    if( socketHandler < 0 ) {
        printf("Eroare la creare socketului pe client \n");
        return 1;
    }

    //Set the socket
    memset(&server, 0, sizeof(server));
    server.sin_port = htons(2015);
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = inet_addr("127.0.0.1");

    //Connect the socket to the server
    if( connect(socketHandler, (struct sockaddr *) &server, sizeof(server)) < 0 ) {
        printf("Eroare la conectarea la server \n");
        return 1;
    }

    //Get string
    fgets(init, sizeof(init), stdin);

    //Transform the string to host
    int size = strlen(init);
    init[size] = '\n';

    for(int i = 0; i < size; i++)
        initConverted[i] = htons(init[i]);

    int sizeConverted = htons(size);

    //Send string to server
    send(socketHandler, &sizeConverted, sizeof(sizeConverted), 0);
    send(socketHandler, &initConverted, sizeof(int) * size, 0);

    //Receive & Convert response string from server
    recv(socketHandler, &resConverted, sizeof(int) * size, 0);
    for(int i = 0; i < size; i++)
        res[i] = ntohs( resConverted[i] );

    printf("Result is: %s", res);

    //Close socket
    close(socketHandler);
}