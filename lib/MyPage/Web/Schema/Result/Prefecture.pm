use utf8;
package MyPage::Web::Schema::Result::Prefecture;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyPage::Web::Schema::Result::Prefecture

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<prefectures>

=cut

__PACKAGE__->table("prefectures");

=head1 ACCESSORS

=head2 prefecture_id

  data_type: 'integer'
  is_nullable: 0

都道府県番号(1:北海道～47:沖縄)

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 20

都道府県名

=cut

__PACKAGE__->add_columns(
  "prefecture_id",
  { data_type => "integer", is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 20 },
);

=head1 PRIMARY KEY

=over 4

=item * L</prefecture_id>

=back

=cut

__PACKAGE__->set_primary_key("prefecture_id");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-29 08:22:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:o0I5Z2HES5e2kCqWmyCrmw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
