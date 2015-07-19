package BBS;
use Modern::Perl;
use BBS::Mandel;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');
  #helper 

  $self->helper( mandel => sub { 
    state $db = BBS::Mandel->connect("mongodb://localhost/bbs");
  });
  $self->helper( mango_bbs => sub {
    state $mango = shift->mandel->storage->db;
  });

  # paramter is $hs = {collection => '..', field=>'..', sort=>'..',number =>'..'}
  $self->helper( last_ten => sub {
    my ($controller, $params) = @_;
    $params->{number} //= 10;
    $params->{sort} //= '_id';
    my $bbs = $controller->mango_bbs;
    my $col = $bbs->collection($params->{collection});
    my $newest = $col->find
      ->sort( { $params->{sort} => -1 } )
      ->fields( { _id => 0, $params->{field} => 1 } )
      ->limit( $params->{number} )
      ->all;

    return [ 
      map { 
        my ($result) =  values $_ ;
        ref $result
          ? $bbs->collection('topics')->find( { _id => $result->{'$id'} })->all->[0]->{title}
          : $result ;
      } @$newest 
    ];
  });



  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('home#authenrication');
  $r->get('/index')->to('home#index');
  $r->get('/default')->to('layouts#frame');
}

1;
