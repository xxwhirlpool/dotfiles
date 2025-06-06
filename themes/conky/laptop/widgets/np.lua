conky.config = require("widgets.lib.common").extend_config {
    -- positioning
    gap_x = 50 + tonumber(os.getenv("NOW_CLOCKING_OFFSET_X") or 0),
    gap_y = 85 + tonumber(os.getenv("NOW_CLOCKING_OFFSET_Y") or 0),
    minimum_height = 200,

    -- text settings
    uppercase = true,
    use_xft = true,
    override_utf8_locale = true,
};

conky.text = [[
${eval ${lua textcolor}}${font JetBrains Mono:pixelsize=80}${time %H:%M:%S}${font JetBrains Mono:pixelsize=65}
${eval ${lua textcolor}}${font JetBrains Mono:pixelsize=35}${lua now}
${eval ${lua textcolor}}${font JetBrains Mono:pixelsize=44}           ${font JetBrains Mono:style=bold:pixelsize=46}${exec ../lastfm.sh artist}${font Gotham:style=bold:pixelsize=10}
${eval ${lua textcolor}}${font JetBrains Mono:pixelsize=44}           ${font JetBrains Mono:pixelsize=23}${exec ../lastfm.sh track}
]];
