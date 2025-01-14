local M = {}

--- Takes TSNode and returns the first ancestor node that matches the given types.
---@param node TSNode|nil
---@param types table<string>
---@return TSNode|nil
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

--- Returns true if program is executable.
--- @param program string
function M.is_executable(program)
  return vim.fn.executable(program) == 1 and true or false
end

return M
