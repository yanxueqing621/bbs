package BBS::Mandel::Board;
use Modern::Perl;
use Mandel::Document;
use Types::Standard qw/Str Int Ref/;

field title => ( isa => Str );
field moderator => ( isa => Ref['ARRAY'] );

has_many topics => 'BBS::Mandel::Topic';
# users is moderator 
has_many users => 'BBS::Mandel::User';


1;
