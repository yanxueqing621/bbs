package BBS;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Router
  my $r = $self->routes;

  #index.html
  $r->get('/index')->to('home#index');

  # Normal route to controller
  $r->get('/')->to('example#welcome');
}

1;
