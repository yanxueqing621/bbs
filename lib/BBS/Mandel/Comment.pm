package BBS::Mandel::Comment;
use Modern::Perl;
use Data::Dumper;
use Mandel::Document;
use Types::Standard qw/Str Int/;

field content => (isa => Str);
field goodCount => (isa => Int);
field createTime => (isa => Int);

belongs_to reply => 'BBS::Mandel::Reply';
belongs_to user => 'BBS::Mandel::User';

1;
