#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define size 1024
#define twoPI 6.28318530717959

void fft(int real[size], int img[size], int real_twid[size], int img_twid[size]);


////////////////////////////////////////////////////////////////////////////////
// Test harness interface code.

struct bench_args_t {
        int real[size];
        int img[size];
        int real_twid[size];
        int img_twid[size];
};
int INPUT_SIZE = sizeof(struct bench_args_t);

void run_benchmark( void *vargs ) {
  struct bench_args_t *args = (struct bench_args_t *)vargs;
  fft(args->real, args->img, args->real_twid, args->img_twid );
}

////////////////////////////////////////////////////////////////////////////////


