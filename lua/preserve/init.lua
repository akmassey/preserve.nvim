local M = {}

function M.setup(opts)
	opts = opts or {}

	-- -- An example mechanism for handling options
	-- vim.keymap.set("n", "<Leader>h", function()
	--    if opts.name then
	--       print("hello, " .. opts.name)
	--    else
	--       print("hello")
	--    end
	-- end)
	vim.keymap.set("n", "Q", '<cmd>lua require("preserve").preserve("normal gqap")<cr>', opts)
	vim.keymap.set("n", "<Leader>a", '<cmd>lua require("preserve").preserve("%!fmt -s 78")<cr>', opts)
	vim.keymap.set("v", "<Leader>a", '<cmd>lua require("preserve").preserve("\'<,\'>!fmt -s 78")<cr>', opts)
end

M.preserve = function(arguments)
	local formatted_arguments = string.format("keepjumps keeppatterns execute %q", arguments)
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_command(formatted_arguments)
	local lastline = vim.fn.line("$")
	if line > lastline then
		line = lastline
	end
	vim.api.nvim_win_set_cursor(0, { line, col })
end

return M
