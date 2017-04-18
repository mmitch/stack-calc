#!perl
use Test::More tests => 3;
use warnings;
use strict;

use Test::Exception;

BEGIN { require_ok( '../stack-calc' ) };

subtest 'stack exhaustion' => sub {
    throws_ok { execute('+') } qr/^stack exhausted/, 'provoke stack exhaustion';
};

subtest 'stack_stack exhaustion' => sub {
    throws_ok { execute('1 )') } qr/^stack_stack exhausted/, 'provoke stack_stack exhaustion';
};
