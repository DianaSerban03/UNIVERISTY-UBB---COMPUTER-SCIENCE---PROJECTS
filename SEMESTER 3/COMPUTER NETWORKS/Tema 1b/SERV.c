#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>

int main() {
  int s;
  struct sockaddr_in server, client;
  int c, l, n=0;

  s = socket(AF_INET, SOCK_STREAM, 0);
  if (s < 0) {
    printf("Eroare la crearea socketului server\n");
    return 1;
  }

  memset(&server, 0, sizeof(server));
  server.sin_port = htons(1256);
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
    uint16_t x, v[100];
    c = accept(s, (struct sockaddr *) &client, &l);
    printf("S-a conectat un client.\n");
    // deservirea clientului
    if (fork()==0){
    recv(c, &x, sizeof(x), MSG_WAITALL);
int i;
    x = ntohs(x);
    n++;
    v[n]=x;
    while (x!=0)
   {
     recv(c, &x, sizeof(x), MSG_WAITALL);
     x = ntohs(x);
    n++;
    v[n]=x;
   }
    for (i=1; i<=n; i++)
       v[i]=htons(v[i]);
    send(c, &v, sizeof(v), 0);
    send(c, &n, sizeof(n), 0);
    close(c);
    return 0;
}
    // sfarsitul deservirii clientului;
  }
}
