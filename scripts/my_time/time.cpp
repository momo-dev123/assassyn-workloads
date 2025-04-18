#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

char buffer[1000000];

int main(int argc, char *argv[]) {
  struct timeval start, end;
  int i, j, total;
  if (argc < 2) {
    printf("Usage: %s <command> [args...]\n", argv[0]);
    return 1;
  }
  gettimeofday(&start, NULL);
  for (i = 1, total = 0; i < argc; ++i) {
    for (j = 0; argv[i][j]; ++j) {
      buffer[total++] = argv[i][j];
    }
    buffer[total++] = ' ';
  }
  buffer[total] = '\0';
  printf("%s\n", buffer);
  if (system(buffer) != 0) {
    printf("Command execution failure!\n");
  }
  gettimeofday(&end, NULL);
  printf("Time taken: %ld\n",
         (end.tv_sec - start.tv_sec) * 1000000 + end.tv_usec - start.tv_usec);
  return 0;
}

