package MyPage::Util::API::Address;
use Moose;
use namespace::autoclean;

extends 'MyPage::Util::API';

sub format_address {
  my ( $self, $row ) = @_;

  return +{
    address_books_id => $row->address_books_id,
    full_name        => $row->full_name,
    sex_code         => $row->sex_code,
    age              => $row->age,
    year             => $row->birth_year,
    month            => $row->birth_month,
    day              => $row->birth_day,
    postal_code      => $row->postal_code,
    prefecture_id    => $row->prefecture_id,
    city             => $row->city,
    address          => $row->address,
    create_time      => $row->get_column('create_time'),
    last_update      => $row->get_column('last_update')
  };
}

sub format_list {
  my ( $self, $rows ) = @_;

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
  } @$rows ];
}

sub format_prefectures {
  my ( $self, $rows ) = @_;

  return [ map { +{
      prefecture_id => $_->prefecture_id,
      name          => $_->name
    }
  } @$rows ];
}


__PACKAGE__->meta->make_immutable;

1;
