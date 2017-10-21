//
// Created by Sorin Sebastian Mircea on 19/10/2017.
//

#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <unistd.h>

int main() {
    int s;
    struct sockaddr_in server, client;
    int c, l;

    s = socket(AF_INET, SOCK_DGRAM, 0);
    if (s < 0) {
        printf("Eroare la crearea socketului...\n");
        return 1;
    }

    memset(&server, 0, sizeof(server));
    server.sin_port = htons(1234);
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;

    if (bind(s, (struct sockaddr *) &server, sizeof(server)) < 0) {
        printf("Eroare la bind...\n");
        return 1;
    }

    l = sizeof(client);
    memset(&client, 0, sizeof(client));

    char last_msg[100];
    while(1) {
        char msg[100];
        recvfrom(s, msg, sizeof(msg), 0, (struct sockaddr *) &client, &l);

        printf("%s\t", msg);
    }
    close(s);

}