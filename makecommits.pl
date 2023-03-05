#!perl

use 5.036;
use strict;
use warnings;
use experimental qw(signatures);

use Time::Local qw( timegm_posix );
use POSIX qw(strftime);

use lib 'lib';
use Font::Fixed_5x7;

$ENV{TZ} = "UTC";

# The grid is one column per week and one row for each day of the week
# The rows start with Sunday

# Returns the epoch timestamp for noon on the first Sunday of the year
sub find_first_sunday_noon ($year) {
    my $jan_1st = timegm_posix(0, 0, 12, 1, 0, $year - 1900);

    # 0 is Sunday
    my $dow = (gmtime($jan_1st))[6];
    my $adjustment = (7 - $dow) % 7;
    my $first_sunday = timegm_posix(0, 0, 12, 1 + $adjustment, 0, $year - 1900);

    return $first_sunday;
}

sub xy_to_epoch ($x, $y, $year) {
    my $first_sunday = find_first_sunday_noon($year);
    my $days_to_add = 7*$x + $y;
    return $first_sunday + $days_to_add * 24*3600;
}

# for my $year (2006..2022) {
#     my $first_sunday = find_first_sunday_noon($year);
#     say strftime("%A %Y-%m-%dT%H:%M:%S", gmtime($first_sunday));
# }

my $year = 2022;
my @chars = map $Fixed_5x7{$_}, split //, $year;

my $output_col = 2;
for my $char (@chars) {
    for my $row_idx (0..$#$char) {
        for my $col_idx (0..length($char->[$row_idx])) {
            next unless substr($char->[$row_idx], $col_idx, 1) eq 'X';
            say strftime("%Y-%m-%dT%H:%M:%S", gmtime(xy_to_epoch($output_col + $col_idx, $row_idx, $year)));
        }
    }
    $output_col += 7;
}