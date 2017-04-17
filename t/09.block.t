#!perl
use Test::More tests => 4;
use warnings;
use strict;

BEGIN { require_ok( '../stack-calc' ) };

subtest 'block is not evaluated' => sub {
    is( execute('{ 1 2 3 * }'), '1 2 3 *' );
};

subtest 'groups in block are evaluated' => sub {
    is( execute('{ 1 ( 2 3 * ) }'), '1 6',     'stack evaluation' );
    is( execute('{ 1 [ 2 3 * ] }'), '1 [ 6 ]', 'list evaluation' );
};

subtest 'block nesting' => sub {
    is( execute('{ 1 { 2 3 } * }'),           '1 2 3 *',       'only blocks' );
    is( execute('{ 1 [ 2 3 * { 1 2 + } ] }'), '1 [ 6 1 2 + ]', 'mixed nesting' );
};

