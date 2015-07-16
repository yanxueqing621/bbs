package BBS::Mandel::User;
use Modern::Perl;
use Mandel::Document;
use Types::Standard qw/Str Int Enum/;
use Type::EmailAddress qw/EmailAddress/;

# VERSION:
# ABSTRACT:

field account => ( isa => Str);
field password => ( isa => Str);
field name => ( isa => Str );
field age => ( isa => Int  );
field birthDay => ( isa => Int );
field sex => ( isa => Str );
field role => ( 
	isa => Enum[qw/admin linux mojolicious normal/],
	 builder => sub { 'normal' } 
);
field email => ( isa => EmailAddress );
has_many topics => "BBS::Mandel::Topic";
has_many replys => "BBS::Mandel::Reply";

1;
