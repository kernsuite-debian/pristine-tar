use strict;
use warnings;

my $rc = 0;

if (scalar(@ARGV) == 0) {
  @ARGV = glob('test/test_*.sh');
}

for my $test (@ARGV) {
  printf("%s\n", $test);
  printf("%s\n", '-' x length($test));
  printf("\n");

  if (system('sh', $test) != 0) {
    $rc++;
  }
}

exit($rc);
