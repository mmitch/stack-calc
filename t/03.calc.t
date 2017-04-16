#!perl
use Test::More tests => 6;
use warnings;
use strict;

BEGIN { require_ok( '../stack-calc' ) };

subtest 'addition' => sub {
    is( execute('2 3 +'),  '5' );
};

subtest 'subtraction' => sub {
    is( execute('2 3 -'),  '1' );
};

subtest 'multiplication' => sub {
    is( execute('2 3 *'),  '6' );
};

subtest 'division' => sub {
    is( execute('2 3 /'),  '1.5' );
};

subtest 'combination' => sub {
    is( execute('4 2 3 / *'),      '6', '(3 / 2) * 4' );
    is( execute('1 2 5 - / 3 +'),  '6', '(5 - 2) / 1 + 3' );
};
