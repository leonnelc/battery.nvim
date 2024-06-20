local M = {}
local timer = vim.uv.new_timer()
M.running = false
function M.start(func)
  if M.running then
    return
  end
  M.running = true
  local config = require("battery.config").current
  timer:start(0, config.update_rate_seconds * 1000, func)
end

function M.stop()
  if not M.running then
    return
  end
  M.running = false
  timer:close()
end

return M
