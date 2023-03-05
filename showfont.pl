#!perl

use 5.036;
use strict;
use warnings;

use lib 'lib';
use Font::Fixed_5x7;

# Just Transpose!
sub concat_chars {
    my @out;
    for my $char ($_[0]->@*) {
        for my $row_idx (0..$#$char) {
            $out[$row_idx] //= '';
            $out[$row_idx] .= $char->[$row_idx] . '.';
        }
    }
    return @out;
}

my $str = '0123456789';
my @chars = map $Fixed_5x7{$_}, split //, $str;

for my $line (concat_chars(\@chars)) {
    say $line =~ tr/./ /r;
}