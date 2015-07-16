use Modern::Perl;
use Data::Dumper;
use Test::More;

BEGIN {
 use_ok('BBS::Mandel');
}

my $db = "mongodb://localhost/bbs";
my $conn= BBS::Mandel->connect($db);

my $users = $conn->collection('user');
my $boards = $conn->collection("board");
my $replies = $conn->collection("reply");
my $topics = $conn->collection("topic");

my $user_conf =  {
    username => 'yxq',
    password =>"123",
    name =>'yxq',
    age => 19,
    birthDay => '111',
    sex => "male",
};
my $board_conf = {
  title => 'mojolicious',
  abstract => "this is this board's  introduction",
};
my $user1 = $users->create($user_conf)->save;
my $board1 = $boards->create($board_conf)->save;
my $topic1 = $board1->add_topics({id=>1, author => 'zhangsan', title => "how to ...", content => 'aa...aa'});
$topic1->add_replies( {content => 'answer is .....', goodCount => '3'});

#say Dumper $user1->data;


done_testing;
