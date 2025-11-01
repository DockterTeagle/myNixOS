require "globals"
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    repo,
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require "options"
_G.LazyVim = require "util"
require("lazy").setup({
  { import = "plugins.general" },
  { import = "plugins.ftplugin" },
}, require "configs.lazy")
vim.schedule(function()
  require "mappings"
end)
vim.schedule(function()
  require "autocmds"
end)
vim.lsp.config("*", {
  on_attach = require("configs.lsp.lspconfigDefaults").on_attach,
  -- capabilities = {}
})
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup(
    "lsp_attach_disable_ruff_hover",
    { clear = true }
  ),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == "ruff" then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
      client.server_capabilities.inlayHintProvider = false
    end
  end,
  desc = "LSP: Disable hover capability from Ruff",
})
require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path }
vim.cmd [[colorscheme tokyonight]]
