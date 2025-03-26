#include "fft.h"

void fft(int real[size], int img[size], int real_twid[size], int img_twid[size]){
    int even, odd, span, log, rootindex;
    long long temp;
    log = 0;

    for(span=size>>1; span; span>>=1, log++){
        for(odd=span; odd<size; odd++){
            odd |= span;
            even = odd ^ span;

            temp = real[even] + real[odd];
            real[odd] = real[even] - real[odd];
            real[even] = temp;

            temp = img[even] + img[odd];
            img[odd] = img[even] - img[odd];
            img[even] = temp;

            rootindex = (even<<log) & (size - 1);
            if(rootindex){
                temp = ((long long) real_twid[rootindex] * real[odd]) -
                  ((long long) img_twid[rootindex]  * img[odd]);
                temp = temp >> 8;
                long long temp2 = ((long long) real_twid[rootindex] * img[odd] +
                    (long long) img_twid[rootindex] * real[odd]);
                img[odd] = temp2 >> 8;
                real[odd] = temp;
            }
        }
    }
}
