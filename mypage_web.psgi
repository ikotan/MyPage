use strict;
use warnings;

use MyPage::Web;

my $app = MyPage::Web->apply_default_middlewares(MyPage::Web->psgi_app);
$app;

