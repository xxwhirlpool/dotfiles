#!/usr/bin/env perl

use 5.38.2;
use strict;
use warnings;

use Template;
use File::Slurp;
use File::Copy;

sub usage {
	die("Usage: iconshare.pl [DIR]\n");
}

my ($icon_dir) = @ARGV;

if (not defined $icon_dir) {
	usage
}

my @icons = read_dir($icon_dir, prefix => 1);

mkdir("out/icons");

if ( -d "out/icons" ) {
	foreach my $icon (@icons) {
		copy($icon, "out/icons") or die "copy failed: $!";
	}
} else {
	die("directory cannot be created: out, $!");
}

my %data = (
	title => "gallery",
	icons => \@icons,
);

my $tt = Template->new({
	INCLUDE_PATH => "./templates",
	INTERPOLATE => 1,
}) or die "$Template::ERROR\n";

my $htmlfile = "out/gallery.html";
$tt->process("iconshare.tt", \%data, $htmlfile) or die $tt->error(), "\n";
