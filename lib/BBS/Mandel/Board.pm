package BBS::Mandel::Board;
use Modern::Perl;
use Mandel::Document;
use Types::Standard qw/Str Int Ref/;

field title => ( isa => Str );
field abstract => ( isa => Str );

has_many topics => 'BBS::Mandel::Topic';
# users is moderator 
has_many moderators => 'BBS::Mandel::User';

1;
