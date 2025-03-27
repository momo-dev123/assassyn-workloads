// See LICENSE for license details.

//**************************************************************************
// Median filter bencmark
//--------------------------------------------------------------------------
//
// This benchmark performs a 1D three element median filter. The
// input data (and reference data) should be generated using the
// median_gendata.pl perl script and dumped to a file named
// dataset1.h You should not change anything except the
// HOST_DEBUG and PREALLOCATE macros for your timing run.

#include "util.h"

#include "median.h"

//--------------------------------------------------------------------------
// Input/Reference Data

#include "dataset1.h"

void median( int n, int input[], int results[] )
{
  int A, B, C, i;

  // Zero the ends
  results[0]   = 0;
  results[n-1] = 0;

  // Do the filter
  for ( i = 1; i < (n-1); i++ ) {

    A = input[i-1];
    B = input[i];
    C = input[i+1];

    if ( A < B ) {
      if ( B < C )
        results[i] = B;
      else if ( C < A )
        results[i] = A;
      else
        results[i] = C;
    }

    else {
      if ( A < C )
        results[i] = A;
      else if ( C < B )
        results[i] = B;
      else
        results[i] = C;
    }

  }

}

//--------------------------------------------------------------------------
// Main

int main( int argc, char* argv[] )
{
  int results_data[DATA_SIZE];

  // Output the input array
  printArray( "input",  DATA_SIZE, input_data  );
  printArray( "verify", DATA_SIZE, verify_data );

#if PREALLOCATE
  // If needed we preallocate everything in the caches
  median( DATA_SIZE, input_data, results_data );
#endif

  // Do the filter
  // setStats(1);
  m5_reset_stats(0, 0);
  median( DATA_SIZE, input_data, results_data );
  m5_dump_stats(0, 0);
  // setStats(0);

  // Print out the results
  printArray( "results", DATA_SIZE, results_data );

  // Check the results
  return verify( DATA_SIZE, results_data, verify_data );
}
