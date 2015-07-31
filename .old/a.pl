use List::Util qw/pairs/;
use 5.010;
use Data::Dumper;

my @arr = qw/a b c d e f g h/;
my @pairs = pairs @arr;
say Dumper @pairs;
