package BBS::Mandel::Topic;
use Modern::Perl;
use Mandel::Document;
use Types::Standard qw/Str Int/;

# VERSION:
# ABSTRACT

field id => ( isa => Int );
field author => ( isa => Str );
field title => ( isa => Str );
field content => ( isa => Str );
# 时间戳
field createTime => ( isa => Int );
field updateTime => ( isa => Int );
# 阅读次数
field number => ( isa => Int );
field goodCount => ( isa => Int );
field badCount => ( isa => Int );
field beizhu => ( isa => Str );

has_many replies => 'BBS::Mandel::Reply';

1;

