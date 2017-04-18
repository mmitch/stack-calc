#!perl
use Test::More tests => 7;
use warnings;
use strict;

use Test::Exception;

BEGIN { require_ok( '../stack-calc' ) };

subtest 'drop from main stack' => sub {
    is( execute('1 2 3 1 d !+'), '5', 'drop 1 token' );
    is( execute('1 2 3 2 d !+'), '3', 'drop 2 tokens' );
    is( execute('[ 1 ] 2 3 1 d !+'), '5', 'drop 1 list' );
};

subtest 'drop from substack' => sub {
    is( execute('10 ( 1 2 3 1 d !+ ) *'), '50', 'drop 1 token' );
};

subtest 'drop from list' => sub {
    is( execute('[ 1 2 3 2 d ]'), '[ 3 ]', 'drop 2 tokens' );
};

subtest 'drop indirectly from list' => sub {
    is( execute('[ 1 2 3 ] 2 di'), '[ 3 ]', 'drop 2' );
};

subtest 'drop more than there are' => sub {
    throws_ok { execute('1 d') } qr/^stack exhausted/, 'provoke stack underflow';
};

subtest 'drop indirect on token errors out' => sub {
    throws_ok { execute('1 1 di') } qr/^di target is plain token/, 'provoke di deref error';
};
