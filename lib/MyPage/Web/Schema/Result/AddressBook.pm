package MyPage::Web::Schema::Result::AddressBook;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;
extends 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

MyPage::Web::Schema::Result::AddressBook

=cut

__PACKAGE__->table("address_books");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 full_name

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 birthday

  data_type: 'date'
  is_nullable: 0

=head2 sex_code

  data_type: 'tinyint'
  is_nullable: 0

=head2 postal_code

  data_type: 'char'
  is_nullable: 0
  size: 8

=head2 prefecture_id

  data_type: 'integer'
  is_nullable: 0

=head2 city

  data_type: 'text'
  is_nullable: 0

=head2 address

  data_type: 'text'
  is_nullable: 0

=head2 created

  data_type: 'datetime'
  is_nullable: 0

=head2 modified

  data_type: 'datetime'
  is_nullable: 0

=head2 delete_flag

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "full_name",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "birthday",
  { data_type => "date", is_nullable => 0 },
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
  "created",
  { data_type => "datetime", is_nullable => 0 },
  "modified",
  { data_type => "datetime", is_nullable => 0 },
  "delete_flag",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2015-08-23 16:27:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uaSHEywYWcNYVBsJ9dcvYA


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
