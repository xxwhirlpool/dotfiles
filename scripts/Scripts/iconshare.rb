#!/usr/bin/env ruby

def usage
	puts "Usage: iconshare.rb [DIR]"
end

icondir = ARGV[0] || "./icons/*"

if icondir.nil?
	puts usage
	exit
end

htmlfile = File.open("./gallery.html", "w+")

css = <<-EOF
	<style>
		html {
			background: #eff1f5;
			display: flex;
			flex-direction: column;
			align-items: center;
		}

		.wrapper {
			background: #303446;
			padding-block: 1rem;
			padding-inline: 1rem;
			max-width: 420px;
		}

		.wrapper img {
			margin-block-end: 4px;
			padding-inline: 2px;
		}
	</style>
EOF

htmlfile.write(css)
htmlfile.write("<main class=\"wrapper\">")

files = Dir[icondir].each do |icon|
	imghtml = "<img src=\"#{icon}\">"
	htmlfile.write(imghtml)
end

htmlfile.write("</main")
