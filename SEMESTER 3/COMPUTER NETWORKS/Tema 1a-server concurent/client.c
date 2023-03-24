#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>

int main() {
  int c;
  struct sockaddr_in server;
  uint16_t x, v[100], n;

  c = socket(AF_INET, SOCK_STREAM, 0);
  if (c < 0) {
    printf("Eroare la crearea socketului client\n");
    return 1;
  }

  memset(&server, 0, sizeof(server));
  server.sin_port = htons(1256);
  server.sin_family = AF_INET;
  server.sin_addr.s_addr = inet_addr("127.0.0.1");

  if (connect(c, (struct sockaddr *) &server, sizeof(server)) < 0) {
    printf("Eroare la conectarea la server\n");
    return 1;
  }

printf("Numarul este: ");
  scanf("%hu", &x);
  x = htons(x);
  send(c, &x, sizeof(x), 0);
  while(x!=0)
    {
       scanf("%hu", &x);
       x = htons(x);
       send(c, &x, sizeof(x), 0);
    }
  recv(c, &v, sizeof(v), 0);
  recv(c, &n, sizeof(n), 0);
  int i;
  for (i=1; i<=n; i++)
    v[i]=ntohs(v[i]);
  printf("Sirul este: \n");
  int j;
  for (j=n-1; j>=1; j--)
    printf("%d", v[j]);
  close(c);
}
