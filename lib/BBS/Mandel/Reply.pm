package BBS::Mandel::Reply;
use Modern::Perl;
use Mandel::Document;
use Types::Standard qw/Str Int/;

field author => ( isa => Str );
field avatar => ( isa => Str );
field content => ( isa => Str );
field goodCount => ( isa => Int );
field createTime => ( isa => Int );



1

