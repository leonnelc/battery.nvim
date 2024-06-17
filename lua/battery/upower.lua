local M = {}
local Job = require("plenary.job")
local battery = require("battery.battery")

local function parse(output)
  local battery_status = {}

  for _, line in ipairs(output) do
    local key, value = line:match("^%s*([%w%s]+):%s*(.+)$")
    if key == "percentage" then
      local perc = value:gsub("%%", "")
      battery_status.percentage = tonumber(perc)
    elseif key == "state" then
      battery_status.state = value
    elseif key == "time to full" then
      battery_status.time_to_full = value
    elseif key == "time to empty" then
      battery_status.time_to_empty = value
    end
  end

  return battery_status
end

function M.get_batteries()
  Job:new({
    command = "upower",
    cwd = "/usr/bin",
    args = { "-e" },
    env = { ["a"] = "b" },
    on_exit = function(j, return_val)
      -- TODO: implement get_batteries
    end,
  }):sync() -- or start()
end

function M.update_battery()
  local config = require("battery.config").current
  Job:new({
    command = "upower",
    cwd = "/usr/bin",
    args = { "-i", config.upower_path },
    env = { ["a"] = "b" },
    on_exit = function(j, return_val)
      if return_val == 1 then
        return
      end
      battery.table = parse(j:result())
      battery.update_status()
    end,
  }):start() -- or start()
end

return M
