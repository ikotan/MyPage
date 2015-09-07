package MyPage::Util::API;
use Moose;
use namespace::autoclean;

extends 'MyPage::Util';

sub format_dbic {
  my ( $self, $data ) = @_;
  return [ map { +{ $_->get_columns } } @$data ];
}

__PACKAGE__->meta->make_immutable;

1;
