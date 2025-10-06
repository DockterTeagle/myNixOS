return{
  {
  "jinzhongjia/LspUI.nvim",
  branch = "main",
  opts = {
    prompt = {
      border = true,
    },
    code_action = {
      enable = true,
      command_enable = true,
      gitsigns = true,
      extend_gitsigns = true,
    },
    hover = {enable = true,command_enable = true,ui = {title = "Hover",
      border = "rounded",
      winblend = 0,},},
      lightbulb ={enable = true,command_enable = true,icon = "💡",
    action_kind = {
      QuickFix = "🔧",
      Refactor = "♻️",
      RefactorExtract = "📤",
      RefactorInline = "📥",
      RefactorRewrite = "✏️",
      Source = "📄",
      SourceOrganizeImports = "📦",
    },}
  },
}
}
