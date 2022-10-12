## base16.lua

Programmatic lua library for setting
[base16](https://github.com/chriskempson/base16) themes in
[Neovim](https://github.com/neovim/neovim).

## Installation

Install the theme with your preferred package manager:

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'bryant-the-coder/base16'
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use 'bryant-the-coder/base16'
```

## Usage

```lua
local base16 = require ("base16")
base16(base16.themes("<theme>"), true)
```
> Change `<theme>` to your preferrable theme

## Advanced Usage
1. Formats an array of 16 hex color strings into a dictionary suitable for use with `base16.apply_theme`.

Example:
```lua
local <theme> = base16.theme_from_array {
--  base00    base01    base02    base03
	"383838"; "404040"; "606060"; "6f6f6f";
--  base04    base05    base06    base07
	"808080"; "dcdccc"; "c0c0c0"; "ffffff";
--  base08    base09    base0A    base0B
	"dca3a3"; "dfaf8f"; "e0cf9f"; "5f7f5f";
--  base0C    base0D    base0E    base0F
	"93e0e3"; "7cb8bb"; "dc8cc3"; "000000";
}
base16(<theme>, true)
```
> Change `<theme>` to your preferrable theme

2. Formats an array of 16 hex color strings into a dictionary suitable for use with base16.apply_theme.
Dictionary of definitions to be used by `base16` or `base16.apply_theme`.

Example:

```lua
base16.themes["zenburn"] == {
	base00 = "383838"; base01 = "404040"; base02 = "606060"; base03 = "6f6f6f";
	base04 = "808080"; base05 = "dcdccc"; base06 = "c0c0c0"; base07 = "ffffff";
	base08 = "dca3a3"; base09 = "dfaf8f"; base0A = "e0cf9f"; base0B = "5f7f5f";
	base0C = "93e0e3"; base0D = "7cb8bb"; base0E = "dc8cc3"; base0F = "000000";
}
> Replace `zenburn` with the theme you want to override

## Credits
- [max397574](https://github.com/max397574/omega-nvim)
- [NvChad](https://github.com/NvChad/base46)
