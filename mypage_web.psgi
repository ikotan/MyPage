use strict;
use warnings;

use lib ('/home/vagrant/practice/Perl_Practice/Catalyst/MyPage/lib');
use MyPage::Web;

my $app = MyPage::Web->apply_default_middlewares(MyPage::Web->psgi_app);
$app;

