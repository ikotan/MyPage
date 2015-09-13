package MyPage::Web::Controller::API::Address;
use Moose;
use namespace::autoclean;
use MyPage::Util::Logic::Address;
use MyPage::Util::API::Address;

use Data::Dumper::Names;

BEGIN { extends 'Catalyst::Controller'; }

sub create :POST Path Args(0) {
  my ( $self, $c ) = @_;

  my $data = MyPage::Util::Logic::Address->new->create_params( $c->req->params );
  $c->model("DBIC::AddressBook")->create( $data );

  $c->res->body(1);
}

sub base :Chained('/') PathPart('api/address') CaptureArgs(1) {
  my ( $self, $c, $args ) = @_;

  $c->stash( address => $c->model("DBIC::AddressBook")->find( $args ) );
}

sub show :Chained('base') GET PathPart('') Args(0) {
  my ( $self, $c ) = @_;

  my $api = MyPage::Util::API::Address->new;

  $c->stash( address_book =>
    $api->format_address( $c->stash->{ address } ) );
}

# sub edit :Chained('base') POST PathPart('') Args(0) {
  # my ( $self, $c ) = @_;
# }

sub delete :Chained('base') DELETE PathPart('') Args(0) {
  my ( $self, $c ) = @_;

  my $address = $c->stash->{ address };
  $c->res->body(0) unless ( $address );

  $address->update( { delete_flag => 1 } );
  $c->res->body(1);
}

sub list :GET Path('') :Args(0) {
  my ( $self, $c ) = @_;

  my $api = MyPage::Util::API::Address->new;
  my $data = $api->format_list(
    MyPage::Util::Logic::Address->new->search_list( $c->req->params ) );

  $c->stash( address_books => $data );
}

sub prefectures :GET Path('prefectures') Args(0) {
  my ( $self, $c ) = @_;

  my $api = MyPage::Util::API::Address->new;
  $c->stash( prefectures =>
    $api->format_prefectures( [ $c->model("DBIC::Prefecture")->all ] ) );
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
