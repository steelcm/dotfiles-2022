require('nvim-tree').setup {
  renderer = {
    indent_markers = {
      enable = true, -- this option shows indent markers when folders are open
    },
  },
  view = {
    adaptive_size = true,
  }
}

-- vim.api.nvim_set_keymap('n', '<Leader>b', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})

-- This highlight override is based on the tokyonight
-- theme. Changing the theme will cause NvimTreeEndOfBuffer to break
vim.cmd[[
    augroup NvimTreeHighlightGroups
        autocmd!
        autocmd BufEnter,ColorScheme * highlight NvimTreeEndOfBuffer guifg=#1f2335
    augroup END
]]
