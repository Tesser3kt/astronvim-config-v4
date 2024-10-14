local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  -- Text Decorators
  s(
    { trig = "em", dscr = "Emphasize text" },
    fmta("\\emph{<>}<>", { i(1), i(0) })
  ),
  s(
    { trig = "bf", dscr = "Embolden text" },
    fmta("\\textbf{<>}<>", { i(1), i(0) })
  ),
  s(
    { trig = "sf", dscr = "Sans serif text" },
    fmta("\\textsf{<>}<>", { i(1), i(0) })
  ),
  s(
    { trig = "al", dscr = "Alert text" },
    fmta("\\alert{<>}<>", { i(1), i(0) })
  ),
  s(
    { trig = "tt", dscr = "Monospace text" },
    fmta("\\texttt{<>}<>", { i(1), i(0) })
  ),
  s(
    { trig = "uv", dscr = "Czech quotes" },
    fmta("\\uv{<>}<>", { i(1), i(0) })
  ),
  s(
    { trig = "__", dscr = "Text underline" },
    fmta("\\underline{<>}<>", { i(1), i(0) })
  ),

  -- Text colors
  s(
    {
      trig = "cl(%l+)",
      regTrig = "true",
      wordTrig = "false",
      dscr = "Text color"
    },
    fmta("\\cl<>{<>}<>",
      {
        f(function(_,snip) return snip.captures[1] end),
        i(1),
        i(0)
      }
    )
  ),

  -- Math Font Decorators
  s(
    { 
      trig = "tt",
      snippetType = "autosnippet",
      dscr = "Math normal text"
    },
    fmta("\\text{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "cal",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "Math calligraphic text"
    },
    fmta("\\mathcal{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%a+)cal",
      priority = 200,
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      dscr = "Math calligraphic text auto"
    },
    fmta(
      "\\mathcal{<>}<>",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "bb",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "Math blackboard text"
    },
    fmta("\\mathbb{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%a+)bb",
      priority = 200,
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      dscr = "Math blackboard text auto"
    },
    fmta(
      "\\mathbb{<>}<>",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "mtt",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Math typewriter text"
    },
    fmta("\\mathtt{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "frak",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "Math fraktal text"
    },
    fmta("\\mathfrak{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%a+)frak",
      priority = 200,
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      dscr = "Math fraktal text auto"
    },
    fmta(
      "\\mathfrak{<>}<>",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "mrm",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "Math roman text"
    },
    fmta("\\mathrm{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%a+)rm",
      priority = 200,
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      dscr = "Math roman text auto"
    },
    fmta(
      "\\mathrm{<>}<>",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "bf",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "Math bold text"
    },
    fmta("\\mathbf{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%a+)bf",
      priority = 200,
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      dscr = "Math bold text auto"
    },
    fmta(
      "\\mathbf{<>}<>",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "sf",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "Math serif text"
    },
    fmta("\\mathsf{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%a+)sf",
      priority = 200,
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      dscr = "Math serif text auto"
    },
    fmta(
      "\\mathsf{<>}<>",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- Math Overset Decorators
  s(
    { 
      trig = "vec",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "Vector arrow overset"
    },
    fmta("\\vec{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%a+)\\%.",
      priority = 200,
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      dscr = "Vector arrow overset auto"
    },
    fmta(
      "\\vec{<>}<>",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "bar",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "Latin bar overset"
    },
    fmta("\\bar{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%a+)bar",
      priority = 200,
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      dscr = "Latin bar overset auto"
    },
    fmta(
      "\\bar{<>}<>",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "tld",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "Tilde overset"
    },
    fmta("\\tilde{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%a+)tld",
      priority = 200,
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      dscr = "Tilde overset auto"
    },
    fmta(
      "\\tilde{<>}<>",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "ndl",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "Underline overset"
    },
    fmta("\\underline{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%a+)\\_",
      priority = 200,
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      dscr = "Underline overset auto"
    },
    fmta(
      "\\underline{<>}<>",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "ovl",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "Overline overset"
    },
    fmta("\\overline{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "hat",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "Open hat overset"
    },
    fmta("\\hat{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%a+)hat",
      priority = 200,
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      dscr = "Open hat overset auto"
    },
    fmta(
      "\\hat{<>}<>",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
}
