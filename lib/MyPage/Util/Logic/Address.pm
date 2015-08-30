package MyPage::Util::Logic::Address;
use Moose;
use namespace::autoclean;

extends 'MyPage::Util::Logic';

use constant DEFAULT_PAGE => 1;
use constant DEFAULT_ROWS => 15;

use Data::Dumper::Names;

sub search_list {
  my ( $self, $params ) = @_;

  my $schema = $self->schema;
  return [ $self->schema->resultset("AddressBook")->search(
    undef,
    {
      join => 'prefecture',
      page => $params->{ page } // DEFAULT_PAGE,
      rows => $params->{ rows } // DEFAULT_ROWS
    }
  ) ];
}

sub create_params {
  my ( $self, $params ) = @_;

  return {
    full_name     => $params->{ full_name },
    birthday      => join( '-', @{ $params }{ qw/year month day/ } ),
    sex_code      => $params->{ sex_code },
    postal_code   => $params->{ postal_code },
    prefecture_id => $params->{ prefecture_id },
    city          => $params->{ city },
    address       => $params->{ address }
  };
}

__PACKAGE__->meta->make_immutable;

1;
