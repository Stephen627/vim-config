# Vim Config

## Requirements

- Make sure you are using a [NerdFont](https://www.nerdfonts.com/) font or a terminal that injects NerdFont icons like
  [kitty](https://sw.kovidgoyal.net/kitty/)
- [lazygit](https://github.com/jesseduffield/lazygit)
- Run nvim +PackerInstall
- Install language servers
    - npm i -g intelephense
    - npm i -g tsserver typescript
    - npm i -g vscode-langservers-extracted
- Install debug servers
    - PHP
        - Example of debug settings in debug/php.json (needs to be copied to
          .vscode/launch.json)
        - git clone https://github.com/xdebug/vscode-php-debug.git /opt/
        - cd /opt/vscode-php-debug
        - npm install && npm run build
