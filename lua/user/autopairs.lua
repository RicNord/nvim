-- Setup nvim-cmp.
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

npairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = [=[[%'%"%>%]%)%}%,]]=],
		end_key = "$",
		before_key = "h",
		after_key = "l",
		cursor_pos_before = true,
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		manual_position = true,
		highlight = "Search",
		highlight_grey = "Comment",
	},
	enable_check_bracket_line = false, -- dont add pair if it exist unclosed on same line
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
