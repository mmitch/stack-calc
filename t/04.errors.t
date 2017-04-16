#!perl
use Test::More tests => 2;
use warnings;
use strict;

use Test::Exception;

BEGIN { require_ok( '../stack-calc' ) };

subtest 'stack exhaustion' => sub {
    dies_ok { execute('+')} 'provoke stack exhaustion';
};
