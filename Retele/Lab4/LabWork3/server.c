#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <unistd.h>

void reverse_string(char a[], char b[]) {
    int n = strlen(a);
    int i, j = 0;

    for(i = n-1; i >=0; i--)
        b[j++] = a[i];
}

int main() {
    int socketHandler, clientHandler;
    struct sockaddr_in server, client;
    int clientSize;
    int size;
    char init[256], res[256];

    //Try to create the socker
    socketHandler = socket(AF_INET, SOCK_STREAM, 0);
    if( socketHandler < 0) {
        printf("Eroare la creare socket-ului server \n");
        return 1;
    }

    //Set server
    memset(&server, 0, sizeof(server));
    server.sin_port = htons(1235);
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
    //
    //Accept connections
    while(1) {
        //Accept & wait for a connection
        clientHandler = accept(socketHandler, (struct sockaddr *) &client, &clientSize);
        printf("S-a connectat un client. \n");

        //Get data from client
        int pos = 0;
        char crtChar;
        do {
            recv(clientHandler, &crtChar, sizeof(char), MSG_WAITALL);
            init[pos++] = crtChar;
        }while(crtChar != '\0');

        //Do something with data
        reverse_string(init, res);
        printf("Reversed string: %s\n", res);

        for(int i = 0; i <= pos; i++)
            send(clientHandler, &res[i], sizeof(char), 0);

        //Close client handler
        close(clientHandler);
    }

}