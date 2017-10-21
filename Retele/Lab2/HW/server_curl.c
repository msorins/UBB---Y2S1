//
// Created by Sorin Sebastian Mircea on 17/10/2017.
//

#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <stdlib.h>
#include <curl/curl.h>

#define SON 0

int hostname_to_ip(char * hostname , char* ip)
{
    struct hostent *he;
    struct in_addr **addr_list;
    int i;

    if ( (he = gethostbyname( hostname ) ) == NULL)
    {
        // get the host info
        herror("gethostbyname");
        return 1;
    }

    addr_list = (struct in_addr **) he->h_addr_list;

    for(i = 0; addr_list[i] != NULL; i++)
    {
        //Return the first one;
        strcpy(ip , inet_ntoa(*addr_list[i]) );
        return 0;
    }

    return 1;
}


int main() {
    int socketServer, httpSocket;
    struct sockaddr_in server, client, httpReq;
    int c, l;

    //Create Socker
    socketServer = socket(AF_INET, SOCK_STREAM, 0);
    if (socketServer < 0) {
        printf("Eroare la crearea socketului server\n");
        return 1;
    }

    //Save server info
    memset(&server, 0, sizeof(server));
    server.sin_port = htons(1245);
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;

    //Create bind
    if (bind(socketServer, (struct sockaddr *) &server, sizeof(server)) < 0) {
        printf("Eroare la bind (1)\n");
        return 1;
    }

    listen(socketServer, 5);

    l = sizeof(client);
    memset(&client, 0, sizeof(client));

    while (1) {
        uint32_t sizeN;
        int size;
        char link[100];

        //Accept client connection
        c = accept(socketServer, (struct sockaddr *) &client, &l);

        //Create new process to compute client's request
        int pid = fork();
        if(pid == SON) {
            printf("Son computing client request \n");

            //Read messages from network
            recv(c, &sizeN, sizeof(sizeN), MSG_WAITALL);
            size = ntohs(sizeN);
            recv(c, &link, sizeof(char) * size, MSG_WAITALL);

            printf("Received: %s\n", link);
            // =======  Create http connection  =======


            //Create Socket
            httpSocket = socket(AF_INET, SOCK_STREAM, 0);
            if (httpSocket < 0) {
                printf("Eroare la crearea socketului \n");
                return 1;
            }

            //Save server info
            char *ip = malloc(sizeof(char) * 100);
            hostname_to_ip(link, ip);
            printf("Ip is: %s\n", ip);

            FILE *fp;
            char path[1035];

            /* Open the command for reading. */
            fp = popen("curl www.google.ro", "r");
            if (fp == NULL) {
                printf("Failed to run command\n" );
                exit(1);
            }

            /* Read the output a line at a time - output it. */
            char res[100000];
            int crtRes = 0;
            res[0] = '\0';
            while (fgets(path, sizeof(path)-1, fp) != NULL) {
                for(int i = 0; i < strlen(path); i++)
                    res[crtRes++] = path[i];
            }
            res[crtRes] = '\0';

            /* close */
            pclose(fp);

            //Convert ints
            uint32_t resSizeN = htons(strlen(res));
            send(c, &resSizeN, sizeof(resSizeN), 0);
            send(c, &res, sizeof(char) * strlen(res), 0);

            //Close connection
            close(c);
            return 0;
        }

        close(c);
    }
}
