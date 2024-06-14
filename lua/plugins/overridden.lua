return {
  --- Insta jump CMP mappings
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping["Tab"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" })
      opts.mapping["S-Tab"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" })
      opts.sources = cmp.config.sources {
          { name = "luasnip", priority = 2000 },
          { name = "nvim_lsp", priority = 750 },
          { name = "buffer", priority = 500 },
          { name = "path", priority = 250 },
        }
    end,
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
}
