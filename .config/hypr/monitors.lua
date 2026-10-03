local vars = require("variables")

hl.monitor({
	output = vars.monitor1,
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = vars.monitor2,
	-- mode = "1920x1080@60",
	mode = "2560x1440@120",
	position = "1920x0",
	scale = 1,
})
--
-- hl.monitor({
-- 	output = "DP-1",
-- 	mode = "3840x2160@120",
-- 	position = "0x0",
-- 	scale = 1,
-- })
--
-- hl.monitor({
-- 	output = "DP-2",
-- 	mode = "3840x2160@60",
-- 	position = "3840x0",
-- 	scale = 1,
-- })
--
-- hl.monitor({
-- 	output = "DP-7",
-- 	mode = "1920x1080@60",
-- 	position = "-1080x0",
-- 	scale = 1,
-- 	transform = 1,
-- })
--
-- hl.monitor({
-- 	output = "DP-8",
-- 	mode = "1920x1080@60",
-- 	position = "-1080x0",
-- 	scale = 1,
-- 	transform = 1,
-- })
