local userPlugins = require("custom.plugins")

local M = {}

M.plugins = {
  user = userPlugins,
}

M.ui = {
   theme = "onedark",
}

M.mappings = require("custom.mappings")

return M
