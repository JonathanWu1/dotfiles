vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'qf', -- quickfix/location list share this
    callback = function()
        vim.opt_local.wrap = true -- enable wrapping
        vim.opt_local.linebreak = true -- wrap at word boundaries
    end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = '*.curl',
    callback = function()
        vim.opt.filetype = 'curl'
    end,
})

vim.api.nvim_create_user_command('JsonDestr', function()
    vim.cmd ':%s/\\\\//ge'
    vim.cmd [[:%!jq '.']]
end, {})

vim.api.nvim_create_user_command('ToTs', function()
    vim.cmd [[silent! :%s/ = .*;/]]
    vim.cmd [[silent! :%s/?/]]
    vim.cmd [[silent! :%s/ .*\./ /]]
    vim.cmd [[silent! :%s/public \(\w*\|\w*<\w*>\) \(\w*\)\s*{ get; set; }/\2 : \1;/]]
    vim.cmd [[silent! :%s/: .*<\w*>/: \[\]/]]
    vim.cmd [[silent! :%s/: \(double\|int\|decimal\)/: number]]
    vim.cmd [[silent! :%s/: \(DateTimeOffset\|DateTime\|DateOnly\)/: Date]]
    vim.cmd [[silent! :%s/: \(Guid\)/: string]]
    vim.cmd [[silent! :%s/: \(bool\)/: boolean]]
    vim.cmd [[silent! :%s/\(\u\)\(\w*\) :/\l\1\2 :]]
end, {})
