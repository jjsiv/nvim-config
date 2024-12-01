local M = {}

---@param node TSNode|nil
---@param types table<string>
function M.find_node_ancestor(node, types)
  if not node then
    return nil
  end

  local node_type = node:type()
  if vim.tbl_contains(types, node_type) then
    return node
  end
  return M.find_node_ancestor(node:parent(), types)
end

return M
