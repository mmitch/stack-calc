#!perl
use Test::More tests => 2;
use warnings;
use strict;

BEGIN { require_ok( '../stack-calc' ) };

subtest 'sequence generation' => sub {
    is( execute('4 seq !+'),     '10' );
};
