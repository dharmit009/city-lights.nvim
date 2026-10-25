local M = {}
local palette = require("city-lights.palette").colors

function M.setup()
  -- Reset existing highlights
  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end
  vim.g.colors_name = "city-lights"
  vim.o.termguicolors = true

  local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Core Neovim Highlights
  hl("Normal",       { fg = palette.fg, bg = palette.bg })
  hl("CursorLine",   { bg = palette.selection })
  hl("Visual",       { bg = palette.selection })
  hl("Comment",      { fg = palette.comment, italic = true })
  hl("Constant",     { fg = palette.red })
  hl("String",       { fg = palette.teal })
  hl("Identifier",   { fg = palette.red })
  hl("Function",     { fg = palette.blue })
  hl("Statement",    { fg = palette.cyan })
  hl("Keyword",      { fg = palette.cyan, bold = true })
  hl("Type",         { fg = palette.orange })
  hl("Special",      { fg = palette.purple })

  -- Tree-sitter Support (Modern Neovim syntax)
  hl("@comment",     { link = "Comment" })
  hl("@function",    { link = "Function" })
  hl("@keyword",     { link = "Keyword" })
  hl("@string",      { link = "String" })
  hl("@variable",    { fg = palette.fg })
  hl("@property",    { fg = palette.red })
end

return M
