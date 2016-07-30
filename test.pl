use strict;
use warnings;

my $rc = 0;
my @failed = ();

if (scalar(@ARGV) == 0) {
  @ARGV = glob('test/test_*.sh');
}

for my $test (@ARGV) {
  printf("%s\n", $test);
  printf("%s\n", '-' x length($test));
  printf("\n");

  if (system('sh', $test) != 0) {
    push @failed, $test;
    $rc++;
  }
}

if (scalar(@failed) > 0 ) {
  print "\n";
  print "FAILED TEST FILES:\n";
  print "------------------\n";
  for my $failed (@failed) {
    print "$failed\n";
  }
  print "\n";
}

exit($rc);
