local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  -- Roots
  s(
    {
      trig = "sq",
      priority = 100,
      snippetType = "autosnippet",
      dscr = "The square root function."
    },
    fmta(
      "\\sqrt{<>}<>",
      { i(1), i(0) }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "nsq",
      priority = 200,
      snippetType = "autosnippet",
      dscr = "The n-th root function."
    },
    fmta(
      "\\sqrt[<>]{<>}<>",
      { i(1, "n"), i(2), i(0) }
    ),
    { condition = tex_utils.in_mathzone }
  ),


  -- Elementary functions
  s(
    {
      trig = "([^\\])sin",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The sine function."
    },
    fmta(
      "<>\\sin",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])cos",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The cosine function."
    },
    fmta(
      "<>\\cos",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])tan",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The tangent function."
    },
    fmta(
      "<>\\tan",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])cot",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The cotangent function."
    },
    fmta(
      "<>\\cot",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])csc",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The cosecant function."
    },
    fmta(
      "<>\\csc",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])sec",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The secant function."
    },
    fmta(
      "<>\\sec",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])ln",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The natural log function."
    },
    fmta(
      "<>\\ln",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])log",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The log function."
    },
    fmta(
      "<>\\log",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])exp",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The exponential function."
    },
    fmta(
      "<>\\exp",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])det",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The determinant function."
    },
    fmta(
      "<>\\det",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])deg",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The degree function."
    },
    fmta(
      "<>\\deg",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])dim",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The dimension function."
    },
    fmta(
      "<>\\dim",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])arcsin",
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The arcsin function."
    },
    fmta(
      "<>\\arcsin",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])arctan",
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The arctan function."
    },
    fmta(
      "<>\\arctan",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])arccot",
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The arccot function."
    },
    fmta(
      "<>\\arccot",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])arccsc",
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The arccsc function."
    },
    fmta(
      "<>\\arccsc",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])arcsec",
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The arcsec function."
    },
    fmta(
      "<>\\arcsec",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- Kernel and image
  s(
    {
      trig = "([^\\])ker",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The kernel."
    },
    fmta(
      "<>\\ker",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])img",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The image."
    },
    fmta(
      "<>\\img",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- Domain and codomain 
  s(
    {
      trig = "([^\\])dom",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The domain."
    },
    fmta(
      "<>\\dom",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])codom",
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The codomain."
    },
    fmta(
      "<>\\codom",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- Maximum / Minimum
  s(
    {
      trig = "([^\\])max",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The maximum."
    },
    fmta(
      "<>\\max",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])min",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The minimum."
    },
    fmta(
      "<>\\min",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- Supremum / Infimum
  s(
    {
      trig = "([^\\])inf",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The infimum."
    },
    fmta(
      "<>\\inf",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([^\\])sup",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The supremum."
    },
    fmta(
      "<>\\sup",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- Cardinality
  s(
    {
      trig = "([^\\])#(%s+)",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "The cardinality of a set."
    },
    fmta(
      "<>\\# ",
      f(function(_, snip) return snip.captures[1] end)
    ),
    { condition = tex_utils.in_mathzone }
  ),
}
