-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Snippets folder
require("luasnip.loaders.from_lua").load { paths = "~/.config/nvim/snippets" }
require("luasnip").config.set_config {
  -- Autotriggered snippets
  enable_autosnippets = true,

  -- Tab to trigger visual selection
  store_selection_keys = "<Tab>",
}

-- Discord Presence
require("presence").setup {
  -- General options
  auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
  neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
  main_image = "neovim", -- Main image display (either "neovim" or "file")
  log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
  debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
  enable_line_number = false, -- Displays the current line number instead of the current project
  blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
  buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
  file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
  show_time = true, -- Show the timer

  -- Rich Presence text options
  editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
  file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
  git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
  plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
  reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
  workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
  line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
}

-- LaTeX local settings
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.tex",
  callback = function()
    vim.opt_local.shiftwidth = 1
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "csa"
    vim.opt_local.textwidth = 80
    vim.opt_local.wrapmargin = 2
    vim.opt_local.formatoptions = "tcq"
    vim.opt_local.colorcolumn = "81"
    -- add item on Enter in itemize/enumerate/description
    vim.cmd [[
      function! AddItem()
        let [end_lnum, end_col] = searchpairpos('\\begin{', '', '\\end{', 'nW')
        if match(getline(end_lnum), '\(itemize\|enumerate\|description\)') != -1
          return "\\item "
        else
          return ""
        endif
      endfunction
      inoremap <expr><buffer> <CR> getline('.') =~ '\item $' 
        \ ? '<c-w><c-w>' 
        \ : (col(".") < col("$") ? '<CR>' : '<CR>'.AddItem() )
      nnoremap <expr><buffer> o "o".AddItem()
      nnoremap <expr><buffer> O "O".AddItem()
    ]]
  end,
})

-- Typst local settings
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.typ",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "csa"
    vim.opt_local.textwidth = 80
    vim.opt_local.wrapmargin = 2
    vim.opt_local.formatoptions = "tcq"
    vim.opt_local.colorcolumn = "81"
  end,
})

-- Python local settings
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.py",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.spell = false
    vim.opt_local.textwidth = 79
    vim.opt_local.colorcolumn = "80"
    vim.opt_local.expandtab = true
    vim.opt_local.autoindent = true
    vim.opt_local.fileformat = "unix"
  end,
})

-- HTML, JS, CSS local settings
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.html", "*.jinja", "*.jinja2", "*.css", "*.scss", "*.sass", "*.js", "*.ts", "*.jsx", "*.tsx" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.spell = false
  end,
})
