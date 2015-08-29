package MyPage::Util::Address;
use Moose;
use namespace::autoclean;

extends 'MyPage::Util';

use Data::Dumper::Names;

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
