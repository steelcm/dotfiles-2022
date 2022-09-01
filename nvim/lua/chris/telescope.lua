local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        color_devicons = false,
        prompt_prefix = "$ ",
        file_ignore_patterns = { "^.git/", "plugged", "node_modules", "undodir" },
        mappings = {
            i = {
                ['<esc>'] = actions.close
            }
        }
    }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')

local M = {}

M.search_dotfiles = function()
    require('telescope.builtin').find_files({
        prompt_title = "<.dotfiles>",
        cwd = '~/.dotfiles',
        hidden = true
    })
end

M.project_files = function()
    local opts = {}
    local ok = pcall(require('telescope.builtin').git_files, opts)
    if not ok then require('telescope.builtin').find_files(opts) end
end

vim.api.nvim_set_keymap('n', '<Leader> ', ':lua require\'chris.telescope\'.project_files()<Cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fd', ':lua require\'chris.telescope\'.search_dotfiles()<Cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>fg', ':lua require\'telescope.builtin\'.live_grep()<Cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fb', ':lua require\'telescope.builtin\'.buffers()<Cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fh', ':lua require\'telescope.builtin\'.help_tags()<Cr>', {noremap = true, silent = true})

return M
