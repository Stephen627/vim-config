local M = {}

local defaultArgs = {
  mode = {},
  keys = {},
  limit = 5,
  message = "Try using other keys rather than repeating keys, or use a number modifier!",
  title = "!!STOP IT!!",
  icon = "😈",
  delay = 5000,
  ignoreFileTypes = { "NvimTree", "dapui_scopes", "dapui_stacks", "dapui_breakpoinst" },
}

function M.setup(args)
  ---@type table
  local config = require('util').simpleMerge(defaultArgs, args)
  ---@type table?
  local id
  for _, key in ipairs(config.keys) do
    local count = 0
    vim.keymap.set(config.mode, key, function()
      if (require('util').tableHasValue(config.ignoreFileTypes, vim.bo.filetype)) then
        return key
      end

      count = count + 1
      vim.defer_fn(function()
        count = count - 1
      end, config.delay)

      if count >= config.limit then
        -- Without the delay it was causing weird buffer issues in notify
        vim.defer_fn(
          function()
            id = vim.notify(config.message, vim.log.levels.WARN, {
              title = config.title,
              icon = config.icon,
              replace = id,
              keep = function()
                return count >= config.limit
              end,
              on_close = function()
                id = nil
              end
            })
          end,
          50
        )
        return
      end

      return key
    end, { expr = true, silent = true })
  end
end

return M

