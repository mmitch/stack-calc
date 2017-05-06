#!perl
use Test::More tests => 5;
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

subtest 'named function reset on every incovation' => sub {
    is( execute('{ 0 } 0 1 defun 1'), '0', 'redefine 1 to 0' );
    is( execute('1'),                 '1', '1 is 1 again' );
};
