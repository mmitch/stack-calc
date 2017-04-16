#!perl
use Test::More tests => 2;
use warnings;
use strict;

BEGIN { require_ok( '../stack-calc' ) };

subtest 'single value is returned' => sub {
    is( execute('1'),  '1' );
};

subtest 'last of multiple values is returned' => sub {
    is( execute('1 2 3'),  '3' );
};

