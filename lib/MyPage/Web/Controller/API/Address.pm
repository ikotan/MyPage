package MyPage::Web::Controller::API::Address;
use Moose;
use namespace::autoclean;
use MyPage::Util::Logic::Address;
use MyPage::Util::API::Address;

use Data::Dumper::Names;

BEGIN { extends 'Catalyst::Controller'; }

sub list :GET Path('list') :Args(0) {
  my ( $self, $c ) = @_;

  my $api = MyPage::Util::API::Address->new;
  my $data = $api->format_list(
    MyPage::Util::Logic::Address->new->search_list( $c->req->params ) );

  $c->stash( address_books => $data );
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
