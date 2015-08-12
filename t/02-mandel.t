use Test::More;
use BBS::Mandel;
use Modern::Perl;
use Data::Dumper;


my $conn = BBS::Mandel->connect("mongodb://localhost/bbs");

my $users = $conn->collection("user");
my $topics = $conn->collection("topic");
my $replies = $conn->collection('reply');

=head
my $user = $users->create(
  {
    name => 'yanxueqing621',
    password => '123',
    name => '闫学青',
    age => 18,
    gender => 'male',
    role => 'admin',
    email => 'yanxueqing621@163.com'
  }
)->save;

my $topic = $user->add_topics(
  {
    title => '如何学习mojo',
    content => '首先要阅读说明文档',
    createTime => time,
    updateTime => time,
  }
);

my $reply = $topic = $topic->add_replys(
  {
    content => '看不懂英文文档怎么办',
  }
);
=cut

$replies->search->single->user($users->search->single);
#say Dumper $reply->user->data;

say 'finished';

done_testing;
