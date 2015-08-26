package MyPage::Web::Controller::Address;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MyPage::Web::Controller::Address - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
}

sub search :Local {
    my ( $self, $c ) = @_;
}

sub create :Local {
    my ( $self, $c ) = @_;
}

sub update :Local {
    my ( $self, $c ) = @_;
}

sub delete :Local {
    my ( $self, $c ) = @_;
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
