local M = {}
M.table = { percentage = nil, state = nil, time_to_full = nil, time_to_empty = nil }
M.status = ""
M.color = ""
M.icon = ""

function M.get_battery_table()
  return M.table
end

function M.get_battery_status()
  return M.status
end

function M.get_battery_icon()
  return M.icon
end

function M.get_battery_color()
  return M.color
end

function M.update_status()
  local config = require("battery.config").current
  if M.table.percentage == nil then
    return
  end
  M.icon = require("battery.misc").get_icon(M.table.percentage)
  M.color = require("battery.misc").get_color(M.table.percentage)
  M.status = ""

  if config.show_number then
    M.status = M.status .. M.table.percentage
  end
  if config.show_percent == true then
    M.status = M.status .. "%%"
  end

  if config.show_icon == true then
    M.status = M.icon .. M.status
  end
end

return M
