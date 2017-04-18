#!perl
use Test::More tests => 4;
use warnings;
use strict;

use Test::Exception;

BEGIN { require_ok( '../stack-calc' ) };

subtest 'single value is returned' => sub {
    is( execute('1'),  '1' );
};

subtest 'last of multiple values is returned' => sub {
    is( execute('1 2 3'),  '3' );
};

subtest 'stack reset on every incovation' => sub {
    is(         execute('1 2'), '2',                  'leave 1 on stack' );
    throws_ok { execute('') }   qr/^stack exhausted/, 'stack is empty on next execution';
};

