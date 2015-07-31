package BBS::Controller::Home;
use Modern::Perl;
use Mojo::Base 'Mojolicious::Controller';


# this action will render a main page
sub index{
  my $self = shift;
  $self->render();
}


1;
