use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyPage::Web';
use MyPage::Web::Controller::Address;

ok( request('/address')->is_success, 'Request should succeed' );
done_testing();
