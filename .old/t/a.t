use Modern::Perl;
use Data::Dumper;
use Test::More;
use Mango;
use BBS::Mandel;

my $db = "mongodb://localhost/bbs";
my $conn= BBS::Mandel->connect($db)->storage;
#say Dumper $conn;

my $user = $conn->db->collection('replys')->find->fields({topic=>1})->limit(2)->all;
$user = $conn->db->collection('replys')->find->all;
say Dumper $user;
say Dumper $conn->db->collection('topics')->find( { _id => $user->[0]->{'topic'}->{'$id'} } )->all->[0]->{title};
say $user->[0]->{'topic'}->{'$id'}; 

done_testing;
