local lush = require("lush")
local hsl = lush.hsl

local theme = lush(function()
  return {
    Normal({
      bg = hsl(100, 50, 0),
      fg = hsl(237, 50, 50),
    }),
  }
end)

-- return our parsed theme for extension or use else where.
return theme
