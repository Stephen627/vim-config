local C = require("catppuccin.palettes").get_palette()

local colors = {
  blue   = C.blue,
  cyan   = C.teal,
  black  = C.surface0,
  white  = C.text,
  red    = C.red,
  violet = C.lavender,
  grey   = C.crust,
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local function getIndexName(str)
  local currentPath = vim.api.nvim_buf_get_name(0)
  local parts = require("util").split(currentPath, "/")
  local fileParts = require("util").split(str, ".")

  local success, val = pcall(function()
    return parts[#parts - 1] .. "." .. fileParts[#fileParts]
  end)

  if not success then
    return str
  end

  return val
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
	fmt = function(str)
		if (string.len(str) > 20) then
			return string.sub(str, 0, 17) .. '...'
		end

		return str
	end
}

local buffers = {
	'buffers',
	show_filename_only = true,   -- Shows shortened relative path when set to false.
	hide_filename_extension = false,   -- Hide filename extension when set to true.
	show_modified_status = true, -- Shows indicator when the buffer is modified.

	mode = 0, -- 0: Shows buffer name
						-- 1: Shows buffer index
						-- 2: Shows buffer name + buffer index
						-- 3: Shows buffer number
						-- 4: Shows buffer name + buffer number

	max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
																			-- it can also be a function that returns
																			-- the value of `max_length` dynamically.
	filetype_names = {
		TelescopePrompt = 'Telescope',
		dashboard = 'Dashboard',
		packer = 'Packer',
		fzf = 'FZF',
		alpha = 'Alpha',

	}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

	symbols = {
		modified = ' ●',      -- Text to show when the buffer is modified
		alternate_file = '#', -- Text to show to identify the alternate file
		directory =  '',     -- Text to show when the buffer is a directory
	},
  separator = { left = '', right = '' },
  right_padding = 2,
  left_padding = 2,
  fmt = function(str)
    if string.find(str, "index") or string.find(str, "init") then
      return getIndexName(str)
    end
    return str
  end
}

local filetype = {
  "filetype",
  fmt = function(str)
    if (str == "javascriptreact") then return "React" end
    if (str == "typescriptreact") then return "TS React" end

    return str
  end,
}

local filename = {
  "filename",
  fmt = function(str)
    if string.find(str, "index") or string.find(str, "init") then
      return getIndexName(str)
    end
    return str
  end
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 5 },
			diagnostics
    },
    lualine_b = { filename, branch, diff },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { filetype, progress },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 5 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
	winbar = {
		lualine_a = {},
    lualine_z = {}
	},
  tabline = {
		lualine_a = { buffers },
  },
  extensions = {},
}

