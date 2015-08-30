package MyPage::Util;
use Moose;
use namespace::autoclean;

has 'schema' => (
  is         => 'rw',
  isa        => 'DBIx::Class',
  lazy_build => 1
);

sub _build_schema {
  return MyPage::Web::Schema->connect(
    'dbi:mysql:mypage', 'root', '',
    {
      AutoCommit => q{1},
      on_connect_do => ["SET NAMES utf8"],
      mysql_enable_utf8 => q{1},
    }
  );
}

__PACKAGE__->meta->make_immutable;

1;
