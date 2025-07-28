---@module "lazy"
---@type LazySpec
return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		priority = 49,
		opts = {
			experimental = {
				-- check_rtp_message = false,
			},
			icon_provider = "mini",
			preview = {
				filetypes = {
					"markdown",
					"rmd",
					"quarto",
					"tex",
					"rmd",
					"typst",
				},
			},
		},
	},
	{
		"obsidian-nvim/obsidian.nvim",
		event = {
			"BufReadPre /home/cdockter/Documents/Obsidian/main/*.md",
			"BufNewFile /home/cdockter/Documents/Obsidian/main/*.md",
		},
		dependencies = {
			-- Required.
			"folke/snacks.nvim",
			-- see above for full list of optional dependencies ☝️
			"nvim-treesitter/nvim-treesitter",
			"OXY2DEV/markview.nvim",
		},
		---@module 'obsidian'
		---@type obsidian.config.ClientOpts
		opts = {
			legacy_commands = false,
			notes_subdir = "notes",
			open = {
				use_advanced_uri = true,
			},
			daily_notes = {
				folder = "notes/dailies",
			},
			templates = {
				folder = "templates",
				date_format = "%Y-%m-%dT%H:%M",
				-- A map for custom variables, the key should be the variable and the value a function
				substitutions = {
					created = function()
						return os.date("%Y-%m-%dT%H:%M")
					end,
					updated = function()
						return os.date("%Y-%m-%dT%H:%M")
					end,
					id = function()
						-- get full path of current buffer
						local filename = vim.api.nvim_buf_get_name(0)
						-- extract file name without path
						filename = filename:match("^.+/(.+)$") or filename
						-- remove the .md extension
						return filename:gsub("%.md$", "")
					end,
				},
			},
			note_frontmatter_func = function(note)
				if note.title then
					note:add_alias(note.title)
				end
				local out = { id = note.id, aliases = note.aliases, tags = note.tags }
				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept in the frontmatter.
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end
				if not out["created"] then
					out["created"] = os.date("%Y-%m-%dT%H:%M")
				end

				out["updated"] = os.date("%Y-%m-%dT%H:%M")
				return out
			end,
			picker = {
				name = "snacks.pick",
			},
			completion = {
				nvim_cmp = false,
				blink = true,
			},
			workspaces = {
				{ name = "main", path = "~/Documents/Obsidian/main" },
			},
		},
	},
}
