#!/usr/bin/env perl

use 5.38.2;
use strict;
use warnings;

use Getopt::Long qw(GetOptions);

sub usage {
	print("Usage: $0 [-e|-d]\n");
	exit 0;
}

GetOptions(
	"d" => \&decrypt,
	"e" => \&encrypt,
) or die(&usage);

sub encrypt {
	print("enter plaintext: ");
	while (my $text = <STDIN>) {
		$text =~ tr/N-ZA-Mn-za-m/A-Za-z/;
		print("\nencrypted: $text");
		exit 0;
	}
}

sub decrypt {
	print("enter encrypted text: ");
	while (my $text = <STDIN>) {
		$text =~ tr/A-Za-z/N-ZA-Mn-za-m/;
		print("\ndecrypted: $text");
		exit 0;
	}
}

usage
