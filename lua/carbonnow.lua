local M = {}

M._options = {
  base_url = "https://carbon.now.sh/",
  theme = "seti",
}

local url_encode = function (str)
   str = string.gsub (str, "([^0-9a-zA-Z !'()*._~-])",
      function (c) return string.format ("%%%02X", string.byte(c)) end)
   str = string.gsub (str, " ", "+")
   return str
end

local get_visual_selection = function ()
  local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
  local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
  local text = vim.api.nvim_buf_get_lines(0, csrow -1, cerow, false)

  text = table.concat(text, "\n")
  return text
end

local build_url = function (code, lang)
  return M._options.base_url .. "?code=" .. url_encode(code) .. "&t=" .. M._options.theme .. "&l=" .. lang
end

local open_url = function (url)
  local command
  local command_args

  if vim.fn.executable('open') == 1 then
    command = 'open'
    command_args = {args = {url}}
  elseif vim.fn.executable('start') == 1 then
    command = 'start'
    command_args = {args={'""', url}}
  elseif vim.fn.executable('xdg-open') == 1 then
    command = 'xdg-open'
    command_args = {args = {url}}
  else
    vim.api.nvim_err_writeln("Could not find executable 'open', 'start' or 'xdg-open'")
    return
  end

  handle = vim.loop.spawn(command, command_args,  function()
    handle:close()
  end)
end

M.setup = function(opts)
  opts = opts or {}
  M._options = vim.tbl_deep_extend("force", {}, M._options, opts)
end

M.capture = function()
  local lang = vim.bo.filetype or "auto"
  local text = get_visual_selection()
  local url = build_url(text, lang)
  open_url(url)
end

return M

