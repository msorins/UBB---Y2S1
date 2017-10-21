//
// Created by Sorin Sebastian Mircea on 12/10/2017.
//

#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <unistd.h>

#define SON 0

void *computeClient(void *handler) {
    int handlerC = (int) handler;
    uint16_t suma, a, b;

    printf("Handler value: %d\n", handlerC);
    printf("Thread computing a client's sum \n");

    recv(handlerC, &a, sizeof(a), MSG_WAITALL);
    recv(handlerC, &b, sizeof(b), MSG_WAITALL);
    a = ntohs(a);
    b = ntohs(b);
    suma = a + b;
    suma = htons(suma);
    send(handlerC, &suma, sizeof(suma), 0);
    close(handlerC);
}
int main() {
    int s;
    struct sockaddr_in server, client;
    int c, l;

    s = socket(AF_INET, SOCK_STREAM, 0);
    if (s < 0) {
        printf("Eroare la crearea socketului server\n");
        return 1;
    }

    memset(&server, 0, sizeof(server));
    server.sin_port = htons(1235);
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;

    if (bind(s, (struct sockaddr *) &server, sizeof(server)) < 0) {
        printf("Eroare la bind\n");
        return 1;
    }

    listen(s, 5);

    l = sizeof(client);
    memset(&client, 0, sizeof(client));

    while (1) {
        uint16_t a, b, suma;
        c = accept(s, (struct sockaddr *) &client, &l);

        pthread_t thread;
        int *handler = malloc(sizeof(int));
        handler = c;

        printf("Handler value :%d\n", handler);
        pthread_create(&thread, NULL, computeClient, handler);
    }
}