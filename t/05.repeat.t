#!perl
use Test::More tests => 6;
use warnings;
use strict;

BEGIN { require_ok( '../stack-calc' ) };

subtest 'repeated addition' => sub {
    is( execute('1 2 3 4 !+'),  '10' );
};

subtest 'repeated subtraction' => sub {
    is( execute('1 2 3 4 !-'),  '-2' );
};

subtest 'repeated multiplication' => sub {
    is( execute('1 2 3 4 !*'),  '24' );
};

subtest 'repeated division' => sub {
    is( execute('1 2 4 20 !/'),  '2.5' );
};

subtest 'combination' => sub {
    is( execute('2 3 * 4 5 * 6 7 !+'), '39', '7 + 6 + (5 * 4) + (3 * 2)' );
};
