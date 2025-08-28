---@module "lazy"
---@type LazySpec
return {
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		dependencies = {
			{ "disrupted/blink-cmp-conventional-commits" },
			{
				"xzbdmw/colorful-menu.nvim",
			},
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
				config = function()
					local ls = require("luasnip")
					local opts = require("configs.luasnip")
					ls.config.set_config(opts)
				end,
			},
		},

		build = "nix run .#build-plugin",

		opts = require("configs.blink-cmp"),
		-- allows extending the providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" },
	},
}
