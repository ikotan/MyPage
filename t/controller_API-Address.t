use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyPage::Web';
use MyPage::Web::Controller::API::Address;

ok( request('/api/address')->is_success, 'Request should succeed' );
done_testing();
