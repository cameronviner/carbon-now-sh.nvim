# carbon-now-sh.nvim

A neovim plugin that enables you to open your selected text in [carbon](https://carbon.now.sh/) so that you can create screenshots of your code for sharing.

## Installation

Using Plug:

`Plug 'cameronviner/carbon-now-sh.nvim'`

## Usage

Call the setup function in your `init.vim`/`init.lua`:

`require("carbonnow").setup()`

Select your text in visual mode and then run:

`:lua require('carbonnow').capture()`

You can also create a keymap to call the function, for example:

`vnoremap <leader>cb :lua require('carbonnow').capture()<CR>`

## Options

You can pass options into the setup function to overwrite the default config:

```
require("carbonnow").setup({
  -- base_url: if you are running an internal instance or a local version you can overwrite the url here
  base_url = "https://carbon.now.sh/" -- This is the default value 
  -- theme: Can be used to overwrite he default theme
  theme = "seti" -- default value
})
```

