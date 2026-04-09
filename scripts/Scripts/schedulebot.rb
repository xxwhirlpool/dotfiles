#!/usr/bin/env ruby
#
# written by ryan of miyaku media
# https://miyaku.media/

require 'erb'
require 'securerandom'
require 'mediainfo'

def print_usage_and_exit
  $stderr.puts "usage:\n  ./schedulebot.rb 20251207T201500 'title1' title1.mp4 'title2' title2.mp4 [...]"
  exit 1
end

debug = false
url = 'https://miru.miyaku.media'

if ARGV.empty?
  print_usage_and_exit
end

arguments = ARGV.dup
start_time = arguments.shift
if arguments.empty? || arguments.length.odd?
  print_usage_and_exit
end

$stderr.puts "Got start time: #{start_time}" if debug
current_time = Time.strptime(start_time, "%Y%m%dT%H%M%S")
$stderr.puts "Reparsed: #{current_time.strftime("%Y%m%dT%H%M%S")}" if debug
until arguments.empty? do
  title = arguments.shift
  filename = arguments.shift
  $stderr.puts "Generating block for #{title} from #{filename}" if debug
  media_info = MediaInfo.from(filename)
  duration = media_info.video.duration
  $stderr.puts "#{duration / 1000} seconds" if debug
  event = ERB.new(<<-EVENTBLOCK).result(binding)
BEGIN:VEVENT
UID:<%= SecureRandom.uuid.upcase %>
DTSTAMP:<%= Time.now.utc.strftime('%Y%m%dT%H%M%SZ') %>
DTSTART;TZID=America/New_York:<%= current_time.strftime("%Y%m%dT%H%M%S") %>
DURATION:P0DT<%= Time.at(duration / 1000).utc.strftime("%HH%MM%SS") %>
SUMMARY:<%= title %>
DESCRIPTION:Livestream at: <%= url %>
URL:<%= url %>
END:VEVENT
EVENTBLOCK

  puts event

  current_time += (duration / 1000)
end
