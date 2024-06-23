local function has_words_before()
  local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end
local function is_visible(cmp) return cmp.core.view:visible() or vim.fn.pumvisible() == 1 end

return {
  --- Insta jump CMP mappings
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      { "rafamadriz/friendly-snippets", lazy = true },
      {
        "hrsh7th/nvim-cmp",
        dependencies = { { "saadparwaiz1/cmp_luasnip", lazy = true } },
        opts = function(_, opts)
          local luasnip, cmp = require "luasnip", require "cmp"

          if not opts.snippet then opts.snippet = {} end
          opts.snippet.expand = function(args) luasnip.lsp_expand(args.body) end

          if not opts.sources then opts.sources = {} end
          table.insert(opts.sources, { name = "luasnip", priority = 2000 })

          if not opts.mappings then opts.mappings = {} end
          opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" })
          opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" })
        end,
      },
    },
  },

  -- Mason plugins
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      end
      vim.list_extend(opts.ensure_installed, {
        "texlab", "pylsp", "html", "cssls", "tailwindcss", "eslint", "tsserver"
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      end
      vim.list_extend(opts.ensure_installed, {
        "latexindent", "autopep8", "flake8", "djlint", "eslint_d"
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      end
      vim.list_extend(opts.ensure_installed, {
        "python"
      })
    end,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    opts = function(_, opts)
      if not opts.disable_filetype then
        opts.disable_filetype = {}
      end
      vim.list_extend(opts.disable_filetype, {
        "tex", "latex"
      })
    end,
  }
}
