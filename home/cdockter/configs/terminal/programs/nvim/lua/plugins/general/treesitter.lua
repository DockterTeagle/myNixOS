return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		dependencies = {
			"OXY2DEV/markview.nvim",
		},
		build = ":TSUpdate",
	},
}
