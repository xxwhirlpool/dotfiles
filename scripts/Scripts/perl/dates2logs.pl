#!/usr/bin/env perl
#
# borrowed a lot from this post & script:
#
# https://jfr.im/blog/2024/03/rewriting-irc-log-timestamps/
# https://jfr.im/git/archive/rewrite-logs.git/tree/rewrite-logs.pl?h=main

use 5.38.2;
use strict;
use warnings;

use File::Basename;
use File::Find;
use File::Temp qw(tempfile);
use File::Copy;

# find all logs recursively
my $dir = "/home/kat/.irc_history/logs";
my @logs; # create log array, empty for now
my @findlogs = find(\&wanted, $dir); # this adds everything to @logs i think

sub wanted {
	return unless -f;
	push @logs, $File::Find::name; # add filenames with paths to @logs
}

foreach my $log (@logs) {
	my ($fn, $dir, $ext) = fileparse($log, ".log");

	my ($outfh, $outfn) = tempfile();

	open(my $fh, "<", "$log") or die("could not open $log: $!");
	while (my $line = <$fh>) {
		# BRENNAN HELPED HERE TY BRENNAN
		# Only match lines with a bare time like "[12:55:02]"
        # the old format missing a date.
        # e.g. "[2026-01-01 12:55:02]", won't match
        # this because right after "["
        # it sees "20", not two digits followed by a ":".
		if ($line =~ /^\[\d{2}:\d{2}:\d{2}\]/) {
			my $newts = substr($line, 1);
			my $newdts = "[$fn $newts";
			print $outfh $newdts;
		} else {
			# do nothing just print what's already there
			print $outfh $line;
		};
	}
	close $outfh;
	copy($outfn, $log)
}
