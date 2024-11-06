-- Lua rewrite of towolf/vim-helm
---@return boolean
local function is_helm()
  local current_buffer = 0
  local filepath = vim.api.nvim_buf_get_name(current_buffer)
  if vim.regex('\\v/(templates)/.*\\.(ya?ml|tpl|txt)$'):match_str(filepath) then
    return true
  end

  local filename = vim.fs.basename(filepath)

  if vim.regex('\\v\\.(gotmpl)$'):match_str(filename) then
    return true
  end

  if vim.regex('\\v(helmfile).*\\.(ya?ml)$'):match_str(filename) then
    return true
  end

  return false
end

vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  callback = function(event)
    if is_helm() then
      vim.bo.filetype = "helm"
    end
  end
})
