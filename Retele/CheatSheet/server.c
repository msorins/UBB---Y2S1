//
// Created by Sorin Sebastian Mircea on 05/10/2017.
//

#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>


int main() {
    int socketHandler, clientHandler;
    struct sockaddr_in server, client;
    int clientSize;

    //Try to create the socker
    socketHandler = socket(AF_INET, SOCK_STREAM, 0);
    if( socketHandler < 0) {
        printf("Eroare la creare socket-ului server \n");
        return 1;
    }

    //Set server
    memset(&server, 0, sizeof(server));
    server.sin_port = htons(2015);
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

        //Get data from client
        recv(clientHandler, &size, sizeof(size), MSG_WAITSTREAM);

        //Send data to client
        send(clientHandler, &resConverted, sizeof(int) * size, 0);

        //Close client handler
        close(clientHandler);
    }

}