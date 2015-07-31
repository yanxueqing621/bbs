use Modern::Perl;
use Test::More;
use BBS::Mandel;

my $mandel;
BEGIN {
  $mandel="BBS::Mandel";
  use_ok($mandel);
}

new_ok($mandel);
done_testing;
