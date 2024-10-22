-- Takes an array of tuples like:
-- {
-- { "Old1", "New1"},
-- { "Old2", "New2" }
-- }
-- Case sensitive
-- Silent
function Find_and_replace_multi(replacements)
	for _, pair in ipairs(replacements) do
		local old = pair[1]
		local new = pair[2]
		vim.cmd("%s/" .. old .. "/" .. new .. "/gIe")
	end
end
