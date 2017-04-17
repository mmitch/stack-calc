#!perl
use Test::More tests => 4;
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

subtest 'stack reset on every incovation' => sub {
    is(         execute('1 2'), '2',                  'leave 1 on stack' );
    throws_ok { execute('') }   qr/^stack exhausted/, 'stack is empty on next execution';
}
