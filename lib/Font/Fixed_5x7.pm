package Font::Fixed_5x7;

use 5.036;
use strict;
use warnings;

# A four digit year with one space between digits will use
# 5*4+3=23 columns
# A year has 52 weeks

# http://rasher.dk/rockbox/fonts/misc/
# http://rasher.dk/rockbox/fonts/misc/6x10-full.png

our @ZERO = (
    "..X..",
    ".X.X.",
    "X...X",
    "X...X",
    "X...X",
    ".X.X.",
    "..X..");
our @ONE = (
    "..X..",
    ".XX..",
    "X.X..",
    "..X..",
    "..X..",
    "..X..",
    "XXXXX");
our @TWO = (
    ".XXX.",
    "X...X",
    "....X",
    "..XX.",
    ".X...",
    "X....",
    "XXXXX");
our @THREE = (
    "XXXXX",
    "....X",
    "...X.",
    "..XX.",
    "....X",
    "X...X",
    ".XXX.");
our @FOUR = (
    "...X.",
    "..XX.",
    ".X.X.",
    "X..X.",
    "XXXXX",
    "...X.",
    "...X.");
our @FIVE = (
    "XXXXX",
    "X....",
    "X.XX.",
    "XX..X",
    "....X",
    "X...X",
    ".XXX.");
our @SIX = (
    "..XX.",
    ".X...",
    "X....",
    "X.XX.",
    "XX..X",
    "X...X",
    ".XXX.");
our @SEVEN = (
    "XXXXX",
    "....X",
    "...X.",
    "...X.",
    "..X..",
    ".X...",
    ".X...");
our @EIGHT = (
    ".XXX.",
    "X...X",
    "X...X",
    ".XXX.",
    "X...X",
    "X...X",
    ".XXX.");
our @NINE = (
    ".XXX.",
    "X...X",
    "X..XX",
    ".XX.X",
    "....X",
    "...X.",
    ".XX..");

our %Fixed_5x7 = (
    '0' => \@ZERO,
    '1' => \@ONE,
    '2' => \@TWO,
    '3' => \@THREE,
    '4' => \@FOUR,
    '5' => \@FIVE,
    '6' => \@SIX,
    '7' => \@SEVEN,
    '8' => \@EIGHT,
    '9' => \@NINE
);

use Exporter qw/import/;
our @EXPORT_OK = qw/@ZERO @ONE @TWO @THREE @FOUR @FIVE @SIX @SEVEN @EIGHT @NINE/;
our @EXPORT = qw/%Fixed_5x7/;

0x55aa