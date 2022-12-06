require('telescope').setup{
    defaults = {
        file_ignore_patterns = { '.git', 'node_modules', 'vendor', 'logs' }
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
