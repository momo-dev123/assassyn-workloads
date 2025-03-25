// See LICENSE for license details.

// *************************************************************************
// multiply filter bencmark
// -------------------------------------------------------------------------
//
// This benchmark tests the software multiply implemenation. The
// input data (and reference data) should be generated using the
// multiply_gendata.pl perl script and dumped to a file named
// dataset1.h You should not change anything except the
// HOST_DEBUG and VERIFY macros for your timing run.

#include "util.h"

#include "multiply.h"

//--------------------------------------------------------------------------
// Input/Reference Data

#include "dataset1.h"

//--------------------------------------------------------------------------
// Main


int multiply( int x, int y )
{

 int i;
 int result = 0;

 for (i = 0; i < 32; i++) {
   if ((x & 0x1) == 1)
     result = result + y;
       
   x = x >> 1;
   y = y << 1;
 } 
 
 return result;

}


int main( int argc, char* argv[] )
{
  int i;
  int results_data[DATA_SIZE];

  // Output the input arrays
  printArray( "input1",  DATA_SIZE, input_data1  );
  printArray( "input2",  DATA_SIZE, input_data2  );
  printArray( "verify", DATA_SIZE, verify_data );

#if PREALLOCATE
  for (i = 0; i < DATA_SIZE; i++)
  {
    results_data[i] = multiply( input_data1[i], input_data2[i] );
  }
#endif

  m5_reset_stats(0,0);
  for (i = 0; i < DATA_SIZE; i++)
  {
    results_data[i] = multiply( input_data1[i], input_data2[i] );
  }
  m5_dump_stats(0,0);
  
  // Print out the results
  printArray( "results", DATA_SIZE, results_data );

  // Check the results
  return verify( DATA_SIZE, results_data, verify_data );
}
