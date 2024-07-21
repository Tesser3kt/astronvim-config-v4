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
