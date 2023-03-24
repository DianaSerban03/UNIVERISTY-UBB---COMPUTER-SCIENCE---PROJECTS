#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>

int main() {
  int c;
  struct sockaddr_in server;
  uint16_t x, aux,  v[100], n, a[100];

  c = socket(AF_INET, SOCK_STREAM, 0);
  if (c < 0) {
    printf("Eroare la crearea socketului client\n");
    return 1;
  }

  memset(&server, 0, sizeof(server));
  server.sin_port = htons(1289);
  server.sin_family = AF_INET;
  server.sin_addr.s_addr = inet_addr("127.0.0.1");

  if (connect(c, (struct sockaddr *) &server, sizeof(server)) < 0) {
    printf("Eroare la conectarea la server\n");
    return 1;
  }

printf("Numarul este: ");
  scanf("%hu", &x);
  aux = htons(x);

  send(c, &aux, sizeof(aux), 0);
  while(x!=0)
    {
       scanf("%hu", &x);
       aux = htons(x);
       send(c, &aux, sizeof(aux), 0);
    }
  recv(c, &a, sizeof(a), 0);
  recv(c, &n, sizeof(n), 0);
  int i;
  for (i=1; i<=n; i++)
    a[i]=ntohs(a[i]);
  printf("Sirul este: \n");
  int j;
  for (j=1; j<=n; j++)
    printf("%d", a[j]);
  close(c);
}
