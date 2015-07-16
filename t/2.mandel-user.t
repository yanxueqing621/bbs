use Modern::Perl;
use Test::More;
use BBS::Mandel;
use BBS::Mandel::User;

#skip "please set environment variable BBS_MONGO_PATH" unless $ENV{BBS_MONGO_PATH};

#my $mandel = new_ok($module);

use_ok('BBS:Mandel::User');

my $user = new_ok("BBS::Mandel::User");

=cut
#my $user = BBS::Mandel::User->new;

#my $user = $mandel->collection("user");

my @fields = qw/username password name age
  birthDay sex role email/;

my @auto_method = qw/add_topics topics search_topics
  add_replies replies search_replies/;

can_ok($user, $_, "$_ field") for @fields; 

can_ok($user, $_, "$_ method") for @auto_method; 

done_testing;
