package MyPage::Util::API::Address;
use Moose;
use namespace::autoclean;

extends 'MyPage::Util::API';

sub format_list {
  my ( $self, $result ) = @_;

  return [ map { +{
      full_name   => $_->full_name,
      sex_code    => $_->sex_code,
      age         => $_->age,
      birthday    => $_->get_column('birthday'),
      postal_code => $_->postal_code,
      prefecture  => $_->prefecture->name,
      create_time => $_->get_column('create_time'),
      last_update => $_->get_column('last_update')
    }
  } @$result ];
}


__PACKAGE__->meta->make_immutable;

1;
