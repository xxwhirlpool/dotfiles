#!/usr/bin/env ruby

require "tempfile"

# provide file ext thru arg
# if not provided it's .txt
ext = ARGV[0] || "txt"

# define tmpfile
tmp = Tempfile.create(["pico-pastes-", ".#{ext}"])
tmpfp = tmp.path

# use $EDITOR, if empty use `nano`
editor = ENV["EDITOR"] ||= "nano"

# open tmpfile in editor
system("#{editor} #{tmpfp}")

# check if tmpfile exists or is empty
# if one or the other, exit here
if !File.exist?("#{tmpfp}") || File.empty?("#{tmpfp}")
	puts "ERROR: #{tmpfp} does not exist or is empty"
	exit 1
end

# send to pastes.sh
cmd = "rsync #{tmpfp} pastes.sh:/"
system(cmd)
