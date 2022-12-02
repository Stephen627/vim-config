# Key Bindings

## Info

- Paste mode and be toggled using \<F4\>
- By default the leader character is \<space\>
- \<cr\> = carriage return = enter
- \<A-x\> means pressing a modifying key with the specified key, in this example it would be Alt + A-x
    - A = Alt
    - C = Ctrl

## General

| Keys                  | Description                                                                                  |
| --------------------- | -------------------------------------------------------------------------------------------- |
| \<leader\>\<cr\>      | Removes any search highlights                                                                |
| \<leader\>q           | Delete the current buffer                                                                    |
| \<leader\>ss          | Toggles highlighting spelling in the active buffer                                           |

## Code Completion and Static Code Analysis

| Keys                  | Description                                                                                  |
| --------------------- | -------------------------------------------------------------------------------------------- |
| gh                    | List the definition and references for the hovered keyword                                   |
| \<leader\>ca          | Show code actions for the current line                                                       |
| gr                    | Rename the current highlighted entity                                                        |
| gd                    | Peek the definition of the highlighted entity                                                |
| \<leader\>gd          | Go to the definition of the highlighted entity                                               |
| \<leader\>cd          | Show diagnostics for the current line                                                        |
| [e                    | Jump to the previous diagnostic event                                                        |
| ]e                    | Jump to the next diagnostic event                                                            |
| [E                    | Jump to the previous diagnostic error event                                                  |
| ]E                    | Jump to the next diagnostic error event                                                      |
| \<leader\>o           | Toggle the file outline                                                                      |
| K                     | Open preview for the highlighted function definition                                         |
| \<C-b\>               | When code completion temp buffer is open, scrolls up                                         |
| \<C-f\>               | When code completion temp buffer is open, scrolls down                                       |
| \<C-Space\>           | When code completion temp buffer is open, fill text with selected row                        |
| \<C-e\>               | When code completion temp buffer is open, abort                                              |

## Git

| Keys                  | Description                                                                                  |
| --------------------- | -------------------------------------------------------------------------------------------- |
| \<A-d\>               | Toggle lazygit terminal                                                                      |
| \<leader\>gsd         | Show git diff for the current buffer                                                         |

## Navigation

| Keys                  | Description                                                                                  |
| --------------------- | -------------------------------------------------------------------------------------------- |
| gb                    | Go to another buffer, the buffers at the top of the window will show the character(s) to use |
| \<C-l\>               | Go to the next buffer                                                                        |
| \<C-h\>               | Go to the previous buffer                                                                    |
| \<leader\>ff          | Fuzzy search all file names                                                                  |
| \<leader\>fg          | Grep all files                                                                               |


## In File Browser

- When opening files from the file browser, it will give you the option to which buffer you want the command to take
  affect open
    - For example,
        - if pressing 'o' on a file, you will need to select the buffer to replace
        - if pressing 'v' on a file, you will be selecting a buffer to open the file vertically next to

| Keys                  | Description                                                                                  |
| --------------------- | -------------------------------------------------------------------------------------------- |
| \<C-n\>               | Toggle file browser                                                                          |
| a                     | Create a new file or folder, to create a folder end the name with a forward slash (/)        |
| l                     | Open a file                                                                                  |
| o                     | Open a file                                                                                  |
| \<cr\>                | Open a file                                                                                  |
| h                     | Close the parent node                                                                        |
| v                     | Open a new file vertically split                                                             |
| x                     | Open a new file horizontal split                                                             |

## Terminal

| Keys                  | Description                                                                                  |
| --------------------- | -------------------------------------------------------------------------------------------- |
| \<C-\\>               | Toggle terminal                                                                              |
| [0-9]*\<C-\\>         | Toggle terminal with id [0-9]*, allows you to open multiple terminals                        |
| \<C-\\>\<C-n\>        | Exit insert mode in the terminal, allows you to search output of commands                    |
| \<C-h\>               | Leaves terminal open and changes the active buffer to the right of the terminal              |
| \<C-l\>               | Leaves terminal open and changes the active buffer to the left of the terminal               |
| \<C-k\>               | Leaves terminal open and changes the active buffer to the top of the terminal                |
| \<C-j\>               | Leaves terminal open and changes the active buffer to the bottom of the terminal             |

