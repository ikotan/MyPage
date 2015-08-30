package MyPage::Web::Controller::Address;
use Moose;
use namespace::autoclean;
use MyPage::Util::Logic::Address;

use Data::Dumper::Names;

BEGIN { extends 'Catalyst::Controller'; }

sub index :Path :Args(0) {
  my ( $self, $c ) = @_;

  $c->stash( address_books =>
    MyPage::Util::Logic::Address->new->search_list( $c->req->params ) );
}

sub get_create :GET Path('create') Args(0) {
  my ( $self, $c ) = @_;

  $c->stash(
    prefectures => [ $c->model("DBIC::Prefecture")->all ],
    template    => 'address/create.tt'
  );
}

sub post_create :POST Path('create') Args(0) {
  my ( $self, $c ) = @_;

  my $data = MyPage::Util::Logic::Address->new->create_params( $c->req->params );
  $c->model("DBIC::AddressBook")->create( $data );

  $c->go('index');
}

sub base :Chained('/') PathPart('address') CaptureArgs(1) {
  my ( $self, $c, $args ) = @_;

  $c->stash(
    prefectures => [ $c->model("DBIC::Prefecture")->all ],
    address     => $c->model("DBIC::AddressBook")->find( $args ),
  );
}

sub get_edit :Chained('base') GET PathPart('edit') Args(0) {
  my ( $self, $c ) = @_;

  $c->stash( template => 'address/edit.tt');
}

sub post_edit :Chained('base') POST PathPart('edit') Args(0) {
  my ( $self, $c ) = @_;
}

sub delete :Chained('base') DELETE PathPart('delete') Args(0) {
  my ( $self, $c ) = @_;
  warn Dumper "############";
  warn Dumper "DELETE";
  warn Dumper "############";
}

=encoding utf8

=head1 AUTHOR

vagrant

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
