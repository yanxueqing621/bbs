package BBS::Mandel::User;
use Modern::Perl;
use Mandel::Document;
use Types::Standard qw/Str Int Enum/;
use Type::EmailAddress qw/EmailAddress/;

# VERSION:
# ABSTRACT:

field username=> ( isa => Str);
field password => ( isa => Str);
field name => ( isa => Str );
field age => ( isa => Int  );
field birthDay => ( isa => Int );
field gender => ( isa => Enum[qw/male female/] );
field reputation => ( isa => Int, builder => sub { 0 } );
field role => ( 
  isa => Enum[qw/admin linux mojolicious member/],
  builder => sub { 'normal' } 
);
field email => ( isa => EmailAddress );

has_many topics => "BBS::Mandel::Topic";
has_many replies => "BBS::Mandel::Reply";
1;
