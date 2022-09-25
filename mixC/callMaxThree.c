#include <stdio.h>
#include <inttypes.h>
extern int64_t maxThree(int64_t, int64_t, int64_t);
int main(){
  printf("%ld\n", maxThree(1,-2,-1));
  printf("%ld\n", maxThree(2,-2,1));
  printf("%ld\n", maxThree(2,-2,3));
  printf("%ld\n", maxThree(2,-4,1));
  printf("%ld\n", maxThree(5,-2,3));

  return 0;
}
