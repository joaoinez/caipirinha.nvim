--- snacks.picker picker integration for caipirinha.
---
---@module 'caipirinha.picker.snacks'
---
local M = {}

--- Uses snacks.picker to pick a colorscheme
---
---@param callback function
---@param _ caipirinha.Options.filter
function M.pick(callback, _)
  local snacks = require('snacks').picker

  snacks.pick {
    source = 'colorschemes',
    finder = 'vim_colorschemes',
    format = 'text',
    preview = 'colorscheme',
    confirm = function(picker, item)
      picker:close()
      if item then vim.schedule(function() callback(item.text) end) end
    end,
  }
end

return setmetatable(M, {
  __call = function(self, ...) return self.pick(...) end,
})
