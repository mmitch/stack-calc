#!perl
use Test::More tests => 3;
use warnings;
use strict;

BEGIN { require_ok( '../stack-calc' ) };

subtest 'substack resolves to top element' => sub {
    is( execute('( 1 )'),         '1', 'single element' );
    is( execute('( 1 2 3 ) !+'),  '3', 'keeping the last' );
};

subtest 'repeat command only acts on substack' => sub {
    is( execute('100 ( 1 2 3 !* ) + 100 +'),  '206' );
};
