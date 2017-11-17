//
// Created by Sorin Sebastian Mircea on 02/11/2017.
//

/*
 * Un client trimite unui server un sir de caractere si un caracter C.
 * Serverul returneaza toate caracterele din sir care se afla inainte de ultima aparitie a lui C.
 */


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

    char strng[100];
    char chr;
    memset(strng, 0, sizeof(strng));

    // ########## CLIENT ##########

    // create the socket (local internet, tcp, 0);
    socketHandler = socket(AF_INET, SOCK_STREAM, 0);
    if( socketHandler < 0 ) {
        printf("Eroare la creare socketului pe client \n");
        return 1;
    }

    //Set the socket
    memset(&server, 0, sizeof(server));
    server.sin_port = htons(3012);
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = inet_addr("127.0.0.1");

    //Connect the socket to the server
    if( connect(socketHandler, (struct sockaddr *) &server, sizeof(server)) < 0 ) {
        printf("Eroare la conectarea la server \n");
        return 1;
    }

    //Get the string from keyboard
    printf("String: \n");
    fgets(strng, sizeof(strng), stdin);
    strng[strlen(strng)] = '\0';

    //Get char from keyboard
    printf("Character: \n");
    scanf("%c", &chr);

    //Send string
    int size = (int) strlen(strng);
    send(socketHandler, &strng, sizeof(char) * size, 0);

    //Send char
    send(socketHandler, &chr, sizeof(char), 0);

    //Receive response
    char crtChar;
    do {
        recv(socketHandler, &crtChar, sizeof(crtChar), 0);
        printf("%c", crtChar);
    }while(crtChar != '\n');

    //Close socket
    close(socketHandler);
}