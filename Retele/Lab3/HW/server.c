//
// Created by Sorin Sebastian Mircea on 24/10/2017.
//


#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
#include <unistd.h>

#define SON 0

void reverse_string(char a[], char b[]) {
    int n = strlen(a);
    int i, j = 0;

    for(i = n-1; i >=0; i--)
        b[j++] = a[i];
}

void main() {
    int sd;
    struct sockaddr_in server, client;
    char message[100], message_rev[100];
    u_short lh, ln;
    int lung, i;
    sd = socket (AF_INET, SOCK_DGRAM, 0);
    printf("socket %d\n", sd);
    memset ((char *) &server, 0, sizeof (server));

    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    server.sin_port = htons (12345);

    i = bind (sd, (struct sockaddr *) &server, sizeof (server));

    while(1) {
        printf("Waiting for clients...\n");
        lung = sizeof(client);
        uint32_t lh, ln;

        //Receive data from client
        i = recvfrom(sd, (int*)&ln, sizeof(ln), 0, (struct sockaddr *) &client, &lung);
        lh = ntohs(ln);
        i = recvfrom(sd, (char*)&message, sizeof(char) * lh, 0, (struct sockaddr *) &client, &lung);


        int pid = fork();
        if(pid == SON) {
            //Do the computation in a separate process
            message[lh] = '\0';
            reverse_string(message, message_rev);

            //Send response to client
            i = sendto(sd, (char*)&message_rev, sizeof(message_rev), 0, (struct sockaddr *) &client, sizeof (client));
            return ;
        }

    }

    close(sd);
}