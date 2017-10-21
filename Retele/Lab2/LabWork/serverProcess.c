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
    server.sin_port = htons(1234);
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

        int pid = fork();
        if(pid == SON) {
            printf("Son computing a client's sum \n");
            recv(c, &a, sizeof(a), MSG_WAITALL);
            recv(c, &b, sizeof(b), MSG_WAITALL);
            a = ntohs(a);
            b = ntohs(b);
            suma = a + b;
            suma = htons(suma);
            send(c, &suma, sizeof(suma), 0);
            close(c);
            return 0;
        }

        close(c);
    }
}