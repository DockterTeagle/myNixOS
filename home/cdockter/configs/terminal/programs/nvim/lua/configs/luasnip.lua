local opts = {
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
}
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		if
			require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
			and not require("luasnip").session.jump_active
		then
			require("luasnip").unlink_current()
		end
	end,
})
return opts
