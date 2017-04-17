#!perl
use Test::More tests => 6;
use warnings;
use strict;

BEGIN { require_ok( '../stack-calc' ) };

subtest 'basic list' => sub {
    is( execute('[ 1 2 3 ]'), '[ 1 2 3 ]', 'not reduced, printed as is');
};

subtest 'nested list' => sub {
    is( execute('[ 1 [ 2 3 ] ]'), '[ 1 [ 2 3 ] ]', 'not reduced, printed as is');
};

subtest 'list content is evaluated' => sub {
    is( execute('[ 1 2 3 + ]'), '[ 1 5 ]');
};

subtest 'operations work on all list elements in turn' => sub {
    is( execute('10 [ 1 2 3 ] *'), '[ 10 20 30 ]', 't1 list, t2 value' );
    is( execute('[ 1 2 3 ] 10 *'), '[ 10 20 30 ]', 't1 value, t2 list' );
};

subtest 'cross product' => sub {
    is( execute('[ 1 2 3 ] [ 4 5 6 ] *'), '[ [ 4 8 12 ] [ 5 10 15 ] [ 6 12 18 ] ]' );
};
