-- use {{/* */}} comments
vim.api.nvim_create_autocmd('FileType', {
    pattern = "helm",
    callback = function(event)
        vim.opt_local.commentstring = '{{/* %s /*}}'
    end
})
