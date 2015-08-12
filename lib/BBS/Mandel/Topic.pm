package BBS::Mandel::Topic;
use Modern::Perl;
use Mandel::Document;
use Types::Standard qw/Str Int/;

# VERSION:
# ABSTRACT

field title => ( isa => Str );
field content => ( isa => Str );
#标签
field tag => (isa => Str);
# 时间戳
field createTime => ( isa => Int );
field updateTime => ( isa => Int );
# 阅读次数
field readCount=> ( isa => Int, builder => sub { 0 } );
field goodCount => ( isa => Int, builder => sub { 0 } );
field badCount => ( isa => Int, builder => sub { 0 } );
#field beizhu => ( isa => Str );

has_many replys => 'BBS::Mandel::Reply';
belongs_to  user => 'BBS::Mandel::User';
1;
