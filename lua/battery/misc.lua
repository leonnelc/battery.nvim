local M = {}
M.battery_icons = {
	[100] = "󰁹",
	[90] = "󰂂",
	[80] = "󰂁",
	[70] = "󰂀",
	[60] = "󰁿",
	[50] = "󰁾",
	[40] = "󰁽",
	[30] = "󰁼",
	[20] = "󰁻",
	[10] = "󰁺",
}
M.battery_colors = {
	[89] = "#00ff00",
	[70] = "#80ff00",
	[60] = "#c0ff00",
	[50] = "#ffff00",
	[40] = "#ffc000",
	[30] = "#ff8000",
	[20] = "#ff4000",
	[10] = "#ff0000",
}

local function get_closest_value(table, key)
	local closest_value = nil
	local smallest_diff = math.huge -- Initializing with a very large number

	for p, _ in pairs(table) do
		local diff = math.abs(p - key)
		if diff < smallest_diff then
			smallest_diff = diff
			closest_value = p
		end
	end

	return table[closest_value]
end

function M.get_icon(battery_perc)
	return get_closest_value(M.battery_icons, battery_perc)
end

function M.get_color(battery_perc)
	return get_closest_value(M.battery_colors, battery_perc)
end

return M
