local M = {}

---@param node TSNode|nil
---@param type string
function M.find_node_ancestor(node, type)
  if not node then
    return nil
  end

  local node_type = node:type()
  if node_type == type then
    return node
  end
  return M.find_node_ancestor(node:parent(), type)
end

return M
