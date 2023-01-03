require('dapui').setup({
  icons = { expanded = '▾', collapsed = '▸' },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { '<cr>', '<2-LeftMouse>' },
    open = '<cr>',
    remove = 'd',
    edit = 'e',
    repl = 'r',
  },
  layouts = {
    {
      elements = {
        { id = 'scopes' , size = 0.25 },
        'breakpoints',
        'stacks',
        'console',
      },
      size = 40,
      position = 'left',
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})
