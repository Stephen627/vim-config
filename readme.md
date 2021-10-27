# Vim Config

## Requirements

- Install fonts in the fonts directory and use it for your terminal font
  - The icons in the main bar and the file explorer require this
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
