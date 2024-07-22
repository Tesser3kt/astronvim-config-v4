function stripBrackets(expression, command)
  local length = string.len(expression)
  local depth = 0
  local i = length

  while true do
    if expression:sub(i,i) == ")" then depth = depth + 1 end
    if expression:sub(i,i) == "(" then depth = depth - 1 end
    if depth == 0 then break end
    i = i - 1
  end

  return expression:sub(1,i-1).."\\"..command.."{"..expression:sub(i+1,length-1).."}"
end

local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  -- Fractions
  s(
    {
      trig = "//",
      snippetType = "autosnippet",
      dscr = "Fraction"
    },
    fmta("\\frac{<>}{<>}<>", { i(1), i(2), i(0)}),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%d+)/",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Auto fraction after digits"
    },
    fmta(
      "\\frac{<>}{<>}<>",
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%d*\\?[A-Za-z]+[%^_]?%d*)/",
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Auto fraction after single digit sub(super)script"
    },
    fmta(
      "\\frac{<>}{<>}<>",
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%d*\\?[A-Za-z]+[%^_]?{%d+})/",
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Auto fraction after multiple digit sub(super)script"
    },
    fmta(
      "\\frac{<>}{<>}<>",
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(.+%))/",
      priority = 1000,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Auto fraction after parenthesis"
    },
    fmta(
      "<>{<>}<>",
      {
        f(function(_, snip)
          return stripBrackets(snip.captures[1], "frac")
        end),
        i(1),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  
  -- Binomials
  s(
    {
      trig = "binom",
      snippetType = "autosnippet",
      dscr = "Binomial"
    },
    fmta("\\binom{<>}{<>}<>", { i(1), i(2), i(0)}),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%d+)bin",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Auto binomial after digits"
    },
    fmta(
      "\\binom{<>}{<>}<>",
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%d*\\?[A-Za-z]+[%^_]?%d*)bin",
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Auto binomial after single digit sub(super)script"
    },
    fmta(
      "\\binom{<>}{<>}<>",
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%d*\\?[A-Za-z]+[%^_]?{%d+})bin",
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Auto binomial after multiple digit sub(super)script"
    },
    fmta(
      "\\binom{<>}{<>}<>",
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(.+%))bin",
      priority = 1000,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Auto binomial after parenthesis"
    },
    fmta(
      "<>{<>}<>",
      {
        f(function(_, snip)
          return stripBrackets(snip.captures[1], "binom")
        end),
        i(1),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- Sums
  s(
    {
      trig = "sum",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "General sum"
    },
    fmta("\\sum_<><><><><><><> <>", {
      f(function(args)
        if string.len(args[1][1]) > 0 then return "{" end
      end, {1}),
      i(1),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {1}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "^" end
      end, {2}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "{" end
      end, {2}),
      i(2),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {2}),
      i(0) 
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "nsum",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Sum from 1 to n"
    },
    fmta("\\sum_{<>}^{<>} <>", {
      i(1, "i = 1"),
      i(2, "n"),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "isum",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Sum over I"
    },
    fmta("\\sum_{<>} <>", {
      i(1, "i \\in I"),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Sums
  s(
    {
      trig = "sum",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "General sum"
    },
    fmta("\\sum_<><><><><><><> <>", {
      f(function(args)
        if string.len(args[1][1]) > 0 then return "{" end
      end, {1}),
      i(1),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {1}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "^" end
      end, {2}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "{" end
      end, {2}),
      i(2),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {2}),
      i(0) 
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "nsum",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Sum from 1 to n"
    },
    fmta("\\sum_{<>}^{<>} <>", {
      i(1, "i = 1"),
      i(2, "n"),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "isum",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Sum over I"
    },
    fmta("\\sum_{<>} <>", {
      i(1, "i \\in I"),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Products
  s(
    {
      trig = "prod",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "General product"
    },
    fmta("\\prod_<><><><><><><> <>", {
      f(function(args)
        if string.len(args[1][1]) > 0 then return "{" end
      end, {1}),
      i(1),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {1}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "^" end
      end, {2}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "{" end
      end, {2}),
      i(2),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {2}),
      i(0) 
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "nprod",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Product from 1 to n"
    },
    fmta("\\prod_{<>}^{<>} <>", {
      i(1, "i = 1"),
      i(2, "n"),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "iprod",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Product over I"
    },
    fmta("\\prod_{<>} <>", {
      i(1, "i \\in I"),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Direct sums
  s(
    {
      trig = "dsum",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "General direct sum"
    },
    fmta("\\bigoplus_<><><><><><><> <>", {
      f(function(args)
        if string.len(args[1][1]) > 0 then return "{" end
      end, {1}),
      i(1),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {1}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "^" end
      end, {2}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "{" end
      end, {2}),
      i(2),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {2}),
      i(0) 
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "ndsum",
      priority = 300,
      snippetType = "autosnippet",
      dscr = "Direct sum from 1 to n"
    },
    fmta("\\bigoplus_{<>}^{<>} <>", {
      i(1, "i = 1"),
      i(2, "n"),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "idsum",
      priority = 300,
      snippetType = "autosnippet",
      dscr = "Direct sum over I"
    },
    fmta("\\bigoplus_{<>} <>", {
      i(1, "i \\in I"),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Unions
  s(
    {
      trig = "uuu",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "General union"
    },
    fmta("\\bigcup_<><><><><><><> <>", {
      f(function(args)
        if string.len(args[1][1]) > 0 then return "{" end
      end, {1}),
      i(1),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {1}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "^" end
      end, {2}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "{" end
      end, {2}),
      i(2),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {2}),
      i(0) 
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "nuu",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Union from 1 to n"
    },
    fmta("\\bigcup_{<>}^{<>} <>", {
      i(1, "i = 1"),
      i(2, "n"),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "iuu",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Union over I"
    },
    fmta("\\bigcup_{<>} <>", {
      i(1, "i \\in I"),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Intersections 
  s(
    {
      trig = "nnn",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "General intersections"
    },
    fmta("\\bigcap_<><><><><><><> <>", {
      f(function(args)
        if string.len(args[1][1]) > 0 then return "{" end
      end, {1}),
      i(1),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {1}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "^" end
      end, {2}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "{" end
      end, {2}),
      i(2),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {2}),
      i(0) 
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "nn1",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Intersection from 1 to n"
    },
    fmta("\\bigcap_{<>}^{<>} <>", {
      i(1, "i = 1"),
      i(2, "n"),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "nni",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Union over I"
    },
    fmta("\\bigcap_{<>} <>", {
      i(1, "i \\in I"),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Integrals
  s(
    {
      trig = "int",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "Empty integral"
    },
    t("\\int "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "rint",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Riemann integral"
    },
    fmta("\\int_{<>}^{<>} ", {
      i(1, "a"),
      i(2, "b")
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "urint",
      priority = 500,
      snippetType = "autosnippet",
      dscr = "Riemann upper integral"
    },
    fmta("\\overline{\\int_{<>}^{<>}} ", {
      i(1, "a"),
      i(2, "b")
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "lrint",
      priority = 500,
      snippetType = "autosnippet",
      dscr = "Riemann lower integral"
    },
    fmta("\\underline{\\int_{<>}^{<>}} ", {
      i(1, "a"),
      i(2, "b")
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "lint",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "General Lebesgue integral"
    },
    fmta("\\int<><><><><><><> <>", {
      f(function(args)
        if string.len(args[1][1]) > 0 then return "_{" end
      end, {1}),
      i(1, "\\Omega"),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {1}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "^" end
      end, {2}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "{" end
      end, {2}),
      i(2),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {2}),
      i(0) 
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "dint",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "dx integral"
    },
    fmta("\\int_<><><><><><><> <> \\, \\mathrm{d}<> <>", {
      f(function(args)
        if string.len(args[1][1]) > 0 then return "{" end
      end, {1}),
      i(1),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {1}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "^" end
      end, {2}),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "{" end
      end, {2}),
      i(2),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "}" end
      end, {2}),
      i(3),
      i(4, "x"),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Limits
  s(
    {
      trig = "lim",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "General limit"
    },
    fmta("\\lim_{<> \\to <>} <>",
      {
        i(1, "n"),
        i(2, "\\infty"),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "clim",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Clean limit"
    },
    fmta("\\lim <>",
      {
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "flim",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Function limit"
    },
    fmta("\\lim_{<> \\to <>} <>",
      {
        i(1, "x"),
        i(2, "a"),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "suplim",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Limes superior"
    },
    fmta("\\limsup_{<> \\to <>} <>",
      {
        i(1, "n"),
        i(2, "\\infty"),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "inflim",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Limes inferior"
    },
    fmta("\\liminf_{<> \\to <>} <>",
      {
        i(1, "n"),
        i(2, "\\infty"),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- Uncategorized stuff
  s(
    {
      trig = "part",
      snippetType = "autosnippet",
      dscr = "Partial derivative"
    },
    fmta("\\frac{\\partial <>}{\\partial <>}<>",
      {
        i(1, "f"),
        i(2, "x"),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "ovst",
      snippetType = "autosnippet",
      dscr = "Overset"
    },
    fmta("\\overset{<>}{<>} <>", {
      i(1, "text"),
      i(2, "="),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  )
}
