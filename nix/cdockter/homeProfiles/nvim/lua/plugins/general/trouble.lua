---@module "lazy"
---@type LazySpec
return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			auto_close = true,
			modes = {
				test = {
					mode = "diagnostics",
					preview = {
						type = "split",
						relative = "win",
						position = "right",
						size = 0.3,
					},
				},
				quickfix = { auto_close = true },
				lsp = {
					win = { position = "right" },
				},
			},
		},
		cmd = "Trouble",
	},
}
