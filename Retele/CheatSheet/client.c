#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
x

int main() {
	int socketHandler;
	struct sockaddr_in server;

	memset(init, 0, sizeof(init));
    memset(res, 0, sizeof(res));

	// ########## CLIENT ##########

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

	 //Send string to server
	send(socketHandler, &sstr, sizeof(sstr), 0);

	//Receive & Convert response string from server
	recv(socketHandler, &sstr, sstr, 0);

	//Close socket
	close(socketHandler);
}