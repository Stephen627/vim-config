# Vim Config

## Help

For a complete list of commands press `<leader>?` (by default the leader character is `<space>`)

## Requirements

- Make sure you are using a [NerdFont](https://www.nerdfonts.com/) font or a terminal that injects NerdFont icons like
  [kitty](https://sw.kovidgoyal.net/kitty/)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- Install language servers
    - Run :Mason within neovim and hover the LSP you require and press `i`
    - Recommended
        - intelephense (PHP)
        - typescript-lanuage-server (TS/JS)
        - css-lsp (CSS/SCSS)
- Install debug servers
    - Run :Mason within neovim and hover the DAP you require and press `i`
    - For PHP, make sure the following settings are enabled for Xdebug 3.x
    ```
    [XDebug]
    zend_extension = xdebug.so
    xdebug.mode = debug,develop,coverage
    xdebug.start_with_request = yes
    xdebug.discover_client_host = yes
    xdebug.client_host = 172.18.0.1
    xdebug.client_port = 9003
    ```
