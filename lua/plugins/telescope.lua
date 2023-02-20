require('telescope').setup{
    defaults = {
        file_ignore_patterns = { '.git', 'node_modules', 'vendor', 'logs' }
    },
		pickerd = {
			current_buffer_fuzzy_find = { sorting_strategy = 'ascending' },
		},
    vimgrep_arguments = 'grep',
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor {
            }
        }
  }
}

require("telescope").load_extension("ui-select")
