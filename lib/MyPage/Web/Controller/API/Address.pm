package MyPage::Web::Controller::API::Address;
use Moose;
use namespace::autoclean;
use MyPage::Util::Logic::Address;
use MyPage::Util::API::Address;

use Data::Dumper::Names;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MyPage::Web::Controller::API::Address - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub list :GET Path('list') :Args(0) {
  my ( $self, $c ) = @_;

  my $api = MyPage::Util::API::Address->new;
  my $data = $api->expand_dbic(
    MyPage::Util::Logic::Address->new->search_list( $c->req->params ) );
  $c->stash( address_books => $data );

  $c->forward("View::JSON");
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
