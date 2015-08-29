package MyPage::Web::Controller::Address;
use Moose;
use namespace::autoclean;
use MyPage::Util::Address;

use Data::Dumper::Names;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MyPage::Web::Controller::Address - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
  my ( $self, $c ) = @_;

  $c->stash(
    address_books => [ $c->model("DBIC::AddressBook")->all ],
  );
}

sub search :Local {
  my ( $self, $c ) = @_;
}

sub get_create :GET Path('create') {
  my ( $self, $c ) = @_;

  $c->stash(
    prefectures => [ $c->model("DBIC::Prefecture")->all ],
    template    => 'address/create.tt'
  );
}

sub post_create :POST Path('create') {
  my ( $self, $c ) = @_;

  my $data = MyPage::Util::Address->new->create_params( $c->req->params );
  $c->model("DBIC::AddressBook")->create( $data );

  $c->res->redirect( $c->uri_for('/address') );
}

sub update :Local {
  my ( $self, $c ) = @_;
}

sub delete :Local {
  my ( $self, $c ) = @_;
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
