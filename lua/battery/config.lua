local M = {}

local default_config = {
  update_rate_seconds = 30,
  upower_path = "/org/freedesktop/UPower/devices/battery_BAT1",
  show_number = true,
  show_percent = true,
  show_icon = false,
}
M.current = default_config
M.from_user_opts = function(user_opts)
  M.current = user_opts and vim.tbl_deep_extend("force", default_config, user_opts) or default_config
end

return M
