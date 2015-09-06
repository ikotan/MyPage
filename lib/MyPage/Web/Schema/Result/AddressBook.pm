use utf8;
package MyPage::Web::Schema::Result::AddressBook;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyPage::Web::Schema::Result::AddressBook

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

=head1 TABLE: C<address_books>

=cut

__PACKAGE__->table("address_books");

=head1 ACCESSORS

=head2 address_books_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

テーブルのキー

=head2 full_name

  data_type: 'varchar'
  is_nullable: 0
  size: 20

氏名(姓名)

=head2 birthday

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

生年月日

=head2 sex_code

  data_type: 'tinyint'
  is_nullable: 0

1:男、2:女

=head2 postal_code

  data_type: 'char'
  is_nullable: 0
  size: 8

郵便番号(XXX-YYYY)

=head2 prefecture_id

  data_type: 'integer'
  is_nullable: 0

都道府県番号(1:北海道～47:沖縄)

=head2 city

  data_type: 'text'
  is_nullable: 0

住所(市区町村)

=head2 address

  data_type: 'text'
  is_nullable: 0

住所(番地・建物)

=head2 create_time

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

作成日時

=head2 last_update

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 delete_flag

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

削除フラグ

=cut

__PACKAGE__->add_columns(
  "address_books_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "full_name",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "birthday",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 0 },
  "sex_code",
  { data_type => "tinyint", is_nullable => 0 },
  "postal_code",
  { data_type => "char", is_nullable => 0, size => 8 },
  "prefecture_id",
  { data_type => "integer", is_nullable => 0 },
  "city",
  { data_type => "text", is_nullable => 0 },
  "address",
  { data_type => "text", is_nullable => 0 },
  "create_time",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
  "last_update",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "delete_flag",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</address_books_id>

=back

=cut

__PACKAGE__->set_primary_key("address_books_id");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-29 07:59:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gqeFlKqhhgXTj9LQfl3lWw

__PACKAGE__->belongs_to( prefecture => 'MyPage::Web::Schema::Result::Prefecture', 'prefecture_id' );

extends 'MyPage::Web::Schema::ResultBase';

sub age {
  my $self = shift;
  return +( $self->now - $self->birthday )->years;
}

sub birth_year { shift->birthday->year }

sub birth_month { shift->birthday->month }

sub birth_day { shift->birthday->day }

# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
