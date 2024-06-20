local M = {}
local timer = vim.uv.new_timer()
function M.start(func)
	local config = require("battery.config").current
	timer:start(0, config.update_rate_seconds * 1000, func)
end

function M.stop()
	timer:close()
end

return M
