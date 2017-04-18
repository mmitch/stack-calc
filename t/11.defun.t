#!perl
use Test::More tests => 5;
use warnings;
use strict;

BEGIN { require_ok( '../stack-calc' ) };

subtest 'simple function without arguments' => sub {
    is( execute('{ 2 } 0 two defun two'), '2', 'define and execute' );
};

subtest 'simple function with 1 argument' => sub {
    is( execute('{ 1 + } 1 inc defun 33 inc'), '34', 'define and execute'  );
};

subtest 'function with 2 arguments' => sub {
    is( execute('{ * } 2 mul defun 3 4 mul'), '12', 'define and execute'  );
};

subtest 'multiple execution' => sub {
    is( execute('{ 1 } 0 one defun one one one one !+'), '4', 'define and execute 4 times'  );
};

