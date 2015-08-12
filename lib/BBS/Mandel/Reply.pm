package BBS::Mandel::Reply;
use Modern::Perl;
use Mandel::Document;
use Types::Standard qw/Str Int/;

field content => ( isa => Str );
field goodCount => ( isa => Int, builder => sub { 0 } );
field createTime => ( isa => Int, builder => sub { time } );

belongs_to topic => 'BBS::Mandel::Topic';
belongs_to user => "BBS::Mandel::User";
has_many comments => 'BBS::Mandel::Comment';

1;
