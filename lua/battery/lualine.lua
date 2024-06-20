-- module that returns a valid, ready to use lualine section
-- example usage with lualine:
-- lualine.setup({ sections = { lualine_x = { require("battery").lualine } } })
local battery = require("battery.battery")
local M = {
	function()
		return battery.get_battery_status()
	end,
	color = function()
		local col = battery.get_battery_color()
		if col == "" then
			return {}
		end
		return { fg = col }
	end,
	padding = 1,
	on_click = function()
		-- TODO: make a window pop up with battery info instead of echoing the percent
		vim.api.nvim_echo({ { require("battery.battery").table.percentage .. "%" } }, false, {})
	end,
}
return M
