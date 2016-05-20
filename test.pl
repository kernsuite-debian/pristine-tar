use strict;
use warnings;

use File::Basename;

my $rc = 0;

unless ($ENV{ADTTMP}) {
  my $srcdir = dirname($0);
  $ENV{PATH} = join(':', "$srcdir/blib/script", "$srcdir/zgz", $ENV{PATH});
  $ENV{PERL5LIB} = "$srcdir/blib/lib";
}

for my $test (glob('test/test_*.sh')) {
  printf("%s\n", $test);
  printf("%s\n", '-' x length($test));
  printf("\n");

  if (system('sh', $test) != 0) {
    $rc++;
  }
}

exit($rc);
