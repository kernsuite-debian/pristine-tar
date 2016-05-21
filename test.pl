use strict;
use warnings;

use File::Basename;
use File::Spec;

my $rc = 0;

(system('make') == 0) or die("make failed");

unless ($ENV{ADTTMP}) {
  my $srcdir = File::Spec->rel2abs(dirname($0));
  $ENV{PATH} = join(':', "$srcdir/blib/script", "$srcdir/zgz", $ENV{PATH});
  $ENV{PERL5LIB} = "$srcdir/blib/lib";
  printf "Setting environment for build-time test\n";
  printf "---------------------------------------\n";
  printf "PATH = %s\n", $ENV{PATH};
  printf "PERL5LIB = %s\n", $ENV{PERL5LIB};
  printf "\n"
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
