#!perl
use Test::More tests => 5;
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
