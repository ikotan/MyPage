package MyPage::Web::Model::DBIC;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'MyPage::Web::Schema',
    
    connect_info => {
        dsn => 'dbi:mysql:mypage',
        user => 'root',
        password => '',
        AutoCommit => q{1},
        on_connect_do => ["SET NAMES utf8"],
    }
);

=head1 NAME

MyPage::Web::Model::DBIC - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<MyPage::Web>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<MyPage::Web::Schema>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.63

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
