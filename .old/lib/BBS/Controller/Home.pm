package BBS::Controller::Home;
use Moo;
use Modern::Perl;
use Data::Dumper;
use namespace::clean;

extends 'Mojolicious::Controller';

# VERSION
# ABSTRACT: home controller

sub index {
  my $self = shift;
  #my $mangodb = $self->mandel->storage->db;  
  my $result = {};
  $self->delay(
    sub {
      $result->{newest}->{users} = $self->last_ten(
        {
          collection => 'users',
          field => 'username',
        }
      );
      $result->{newest}->{topics} = $self->last_ten(
        {
          collection => 'topics',
          field => 'title'
        }
      );
      $result->{newest}->{hots} = $self->last_ten(
        {
          collection => 'topics',
          sort => 'readCount',
          field => 'title',
        }
      );
      $result->{newest}->{replys} = $self->last_ten(
        {
          collection => 'replys',
          field => 'topic'
        }
      );
      $result->{boards} = $self->mango_bbs->collection("boards")->find
        ->fields( { _id => 0, title => 1, topicCount => 1, replyCount => 1})
        ->all;

      #say Dumper $result;
      $self->render( result => $result );
      
    }
  );
  
}

1;
