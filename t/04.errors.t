#!perl
use Test::More tests => 3;
use warnings;
use strict;

use Test::Exception;

BEGIN { require_ok( '../stack-calc' ) };

subtest 'stack exhaustion' => sub {
    dies_ok { execute('+')} 'provoke stack exhaustion';
};

subtest 'stack_stack exhaustion' => sub {
    dies_ok { execute(')')} 'provoke stack_stack exhaustion';
};
