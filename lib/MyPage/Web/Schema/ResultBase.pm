package MyPage::Web::Schema::ResultBase;

use strict;
use warnings;

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
use DateTime;

extends 'DBIx::Class';

__PACKAGE__->load_components(qw/InflateColumn::DateTime Core/);

sub now { DateTime->now( time_zone => 'Asia/Tokyo' ) }

sub insert {
    my $self = shift;

    my $now = $self->now;
    $self->create_time( $now ) if $self->can('create_time');
    $self->last_update( $now ) if $self->can('last_update');

    $self->next::method(@_);
}

__PACKAGE__->meta->make_immutable;
1;


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
