#!perl
use Test::More tests => 2;
use warnings;
use strict;

use Test::TempDir::Tiny;
use IO::Capture::Stdout;

BEGIN { require_ok( '../stack-calc' ) };

subtest 'repl executes lines' => sub {

    my $stdin = "1\n" . "1 2\n";
    my $stdin_file = create_file( tempdir(), 'stdin', $stdin );
    my $stdin_fh = IO::File->new;
    $stdin_fh->open( $stdin_file, '<' );
    
    my $capture = IO::Capture::Stdout->new();
    $capture->start;
    repl($stdin_fh);
    $capture->stop;
    
    is( $capture->read, '1', '1st line successful' );
    is( $capture->read, '2', '2nd line successful' );
    is( $capture->read, undef, 'no third line' );
};

### helper functions

sub create_file
{
    my ($dir, $basename, $content) = (@_);

    my $name = "$dir/$basename";
    open OUT, '>', $name or die "can't open `$name': $!";
    print OUT $content;
    close OUT or die "can't close `$name': $!";
    
    return $name;
}
