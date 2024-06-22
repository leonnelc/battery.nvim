local M = {}
local config = require("battery.config")
local upower = require("battery.upower")
local loop = require("battery.loop")

function M.setup(opts)
	config.from_user_opts(opts)
	if vim.fn.executable("upower") ~= 1 then
		vim.api.nvim_notify("upower executable not found, battery.nvim will not start", vim.log.levels.WARN, {})
		return
	end
	loop.start(upower.update_battery)
end

M.get_battery_color = require("battery.battery").get_battery_color
M.get_battery_icon = require("battery.battery").get_battery_icon
M.get_battery_table = require("battery.battery").get_battery_table
M.get_battery_status = require("battery.battery").get_battery_status
M.lualine = require("battery.lualine")
return M
