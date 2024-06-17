local M = {}
M.table = { percentage = nil, state = nil, time_to_full = nil, time_to_empty = nil }
M.status = ""
function M.get_battery_table()
	return M.table
end

function M.get_battery_status()
	return M.status
end
-- TODO: add a get_status_color function

function M.update_status()
	local config = require("battery.config").current
	if M.table.percentage == nil then
		return
	end
	M.status = "" .. M.table.percentage
	if config.show_percent == true then
		M.status = M.status .. "%%"
	end
  if config.show_icon == true then end -- TODO: implement icons
end

return M
