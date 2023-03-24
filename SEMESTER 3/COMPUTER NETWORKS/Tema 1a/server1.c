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
  server.sin_port = htons(1289);
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

    uint16_t x, v[100], a[100];
    c = accept(s, (struct sockaddr *) &client, &l);
    printf("S-a conectat un client.\n");
    // deservirea clientului
    recv(c, &x, sizeof(x), MSG_WAITALL);

    int i;
    x = ntohs(x);
    printf("%d", x);
    n++;
    v[n]=x;
    while (x!=0)
   {
     recv(c, &x, sizeof(x), MSG_WAITALL);
     x = ntohs(x);
     printf("%d", x);
    n++;
    v[n]=x;
   }
   int j, k=0;
   for (j=n-1; j>=1; j--)
      {
         k++;
         a[k]=v[i];
         printf("%d", a[k]);

      }
    for (i=1; i<=k; i++)
       a[i]=htons(a[i]);
    send(c, &a, sizeof(a), 0);
    send(c, &k, sizeof(k), 0);
    close(c);
    // sfarsitul deservirii clientului;
  }
