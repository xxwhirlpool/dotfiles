#!/usr/bin/env perl

use 5.38.2;
use strict;
use warnings;

use Term::ANSIColor qw(:constants);

sub readfile {
	print("paste writing:\n(submit text with ctrl+d)\n\n");
	my @writing = <STDIN>;
	print("\n\n"); # idk how to have it not print STDIN so linebreaks it is

	foreach my $line (@writing) {
		if($line =~ /\b([A-Za-z]+) \1\b/) {
			print("found repeat: ");
			print(RED, "$&" , RESET, "\n");
		}
	}
}

readfile
