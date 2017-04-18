#!perl
use Test::More tests => 3;
use warnings;
use strict;

BEGIN { require_ok( '../stack-calc' ) };

subtest 'sequence generation' => sub {
    is( execute('4 seq !+'), '10' );
};

subtest 'sequence over list' => sub {
    is( execute('[ 1 2 3 ] seq') , '[ [ 1 ] [ 1 2 ] [ 1 2 3 ] ]' );
};
