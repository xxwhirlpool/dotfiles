#!/usr/bin/env perl

use 5.38.2;
use strict;
use warnings;

use Getopt::Long qw(GetOptions);

sub usage {
	print("Usage: urlref.pl [--get-code|--help]\n
	run without args to add URL\n");
	exit 0;
}

my $getcode;

GetOptions(
	"get-code=s" => \$getcode,
	"help" => \&usage,
) or die "\nif you want to get a URL, supply a code: --get-code [CODE]\n";

sub encode {
	my @chars = ("A".."Z","0".."9","_");

	my $string;
	$string .= $chars[int(rand(@chars))] for 1..5;

	return $string;
}

sub addurl {
	my $url = <STDIN>;
	chomp $url;
	my $code = encode($url);

	if (!length $url == 0) {
		print("code is: $code\n");

		my $filename = "links.txt";

		open(my $fh, ">>", "$filename") or die "could not open $filename: $!";
		print $fh "$code $url\n";
		close $fh;

		print("saved URL to file: $filename\n");
	} else {
		die("no URL given");
	}
}

if ($getcode) {
	my $filename = "links.txt";

	open(my $fh, "<", "$filename") or die "could not open $filename: $!";
	while(my $line = <$fh>) {
		if($line =~ /^$getcode\s/) {
			print("found: $line");
		}
	}
	close $fh;
} else {
	addurl
}
