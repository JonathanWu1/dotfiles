return {
    'rose-pine/neovim',
    priority = 1000,
    lazy = false,
    init = function()
        require('rose-pine').setup {
            variant = 'moon',
            extend_background_behind_borders = true,

            enable = {},
            styles = {
                italic = false,
                transparency = true,
            },
            highlight_groups = {
                ['@variable'] = { fg = 'foam' },
                ['@type'] = { fg = '#ebbcba' },
                ['@lsp.type.method'] = { fg = 'foam' },
                ['@lsp.type.extensionMethod.cs'] = { fg = 'pine' },
                ['@keyword'] = { fg = 'pine' },
            },
        }
        vim.cmd 'colorscheme rose-pine'
    end,
}
