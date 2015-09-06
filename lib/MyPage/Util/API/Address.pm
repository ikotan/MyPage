package MyPage::Util::API::Address;
use Moose;
use namespace::autoclean;

extends 'MyPage::Util::API';

sub format_address {
  my ( $self, $result ) = @_;

  return +{
    address_books_id => $result->address_books_id,
    full_name        => $result->full_name,
    sex_code         => $result->sex_code,
    age              => $result->age,
    birthday         => $result->get_column('birthday'),
    postal_code      => $result->postal_code,
    prefecture       => $result->prefecture->name,
    create_time      => $result->get_column('create_time'),
    last_update      => $result->get_column('last_update')
  };
}

sub format_list {
  my ( $self, $result ) = @_;

  return [ map { +{
      address_books_id => $_->address_books_id,
      full_name        => $_->full_name,
      sex_code         => $_->sex_code,
      age              => $_->age,
      birthday         => $_->get_column('birthday'),
      postal_code      => $_->postal_code,
      prefecture       => $_->prefecture->name,
      create_time      => $_->get_column('create_time'),
      last_update      => $_->get_column('last_update')
    }
  } @$result ];
}


__PACKAGE__->meta->make_immutable;

1;
