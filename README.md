# carbon-now-sh.nvim

A neovim plugin that enables you to open your selected text in [carbon](https://carbon.now.sh/) so that you can create screenshots of your code for sharing.

## Installation

Using Plug:

`Plug 'cameronviner/carbon-now-sh.nvim'`

## Usage


Select your text in visual mode and then run:

`:lua require('carbonnow').capture()`

You can also create a keymap to call the function, for example:

`vnoremap <leader>cb :lua require('carbonnow').capture()<CR>`

## Options

Call the setup function in your `init.vim`/`init.lua` and pass in options to overwrite the default config:

```
require("carbonnow").setup({
  -- base_url: If you are running an private/local instance you can overwrite the url
  base_url = "https://carbon.now.sh/" -- This is the default value 
  -- theme: Can be used to overwrite the default theme
  theme = "seti" -- This is the default value
})
```

