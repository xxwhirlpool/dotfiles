conky.config = require("widgets.lib.common").extend_config {
    -- positioning
	    gap_x = 50 + tonumber(os.getenv("NOW_CLOCKING_OFFSET_X") or 0),
	    gap_y = 115 + tonumber(os.getenv("NOW_CLOCKING_OFFSET_Y") or 0),
	    minimum_width = 100,
	    minimum_height = 100,
};

conky.text = [[
${execp ../lastfm.sh art}
]];
