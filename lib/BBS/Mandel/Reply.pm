package BBS::Mandel::Reply;
use Modern::Perl;
use Mandel::Document;
use Types::Standard qw/Str Int/;

field content => ( isa => Str );
field goodCount => ( isa => Int );
field createTime => ( isa => Int );

belongs_to topic => 'BBS::Mandel::Topic';
belongs_to user => "BBS::Mandel::User";
belongs_to board => "BBS::Mandel::Board";

1;

