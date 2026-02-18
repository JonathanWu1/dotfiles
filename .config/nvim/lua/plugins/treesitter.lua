return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        ensure_installed = { 'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'c_sharp', 'tsx', 'typescript', 'scss' },
        auto_install = true,
        highlight = {
            enable = true,
        },
        indent = { enable = true },
    },
    config = function()
        require('nvim-treesitter').install { 'c_sharp' }
        require('nvim-treesitter').install { 'typescript' }
        require('nvim-treesitter').install { 'tsx' }
        require('nvim-treesitter').install { 'javascript' }
        require('nvim-treesitter').install { 'jsx' }
    end,
}
