local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  -- Digit subscripts
  s(
    {
      trig = "([A-Za-z]+[%)%]}]?)(%d)",
      priority = 100,
      snippetType = "autosnippet",
      wordTrig = false,
      regTrig = true,
      dscr = "Auto digit subscript"
    },
    fmta("<>_<>", {
      f(function(_,snip)
        return snip.captures[1]
      end),
      f(function(_,snip)
        return snip.captures[2]
      end),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([A-Za-z]+[%)%]}]?)_(%d%d)",
      priority = 200,
      snippetType = "autosnippet",
      wordTrig = false,
      regTrig = true,
      dscr = "Auto multiple digit subscript"
    },
    fmta("<>_{<>}", {
      f(function(_,snip)
        return snip.captures[1]
      end),
      f(function(_,snip)
        return snip.captures[2]
      end),
    }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Index subscripts
  s(
    {
      trig = "([A-Za-z]+[%)%]}]?)ii",
      priority = 100,
      snippetType = "autosnippet",
      wordTrig = false,
      regTrig = true,
      dscr = "Auto i subscript"
    },
    fmta("<>_i", {
      f(function(_,snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([A-Za-z]+[%)%]}]?)jj",
      priority = 100,
      snippetType = "autosnippet",
      wordTrig = false,
      regTrig = true,
      dscr = "Auto j subscript"
    },
    fmta("<>_j", {
      f(function(_,snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([A-Za-z]+[%)%]}]?)kk",
      priority = 100,
      snippetType = "autosnippet",
      wordTrig = false,
      regTrig = true,
      dscr = "Auto k subscript"
    },
    fmta("<>_k", {
      f(function(_,snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([A-Za-z]+[%)%]}]?)ll",
      priority = 100,
      snippetType = "autosnippet",
      wordTrig = false,
      regTrig = true,
      dscr = "Auto l subscript"
    },
    fmta("<>_l", {
      f(function(_,snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([A-Za-z]+[%)%]}]?)mm",
      priority = 100,
      snippetType = "autosnippet",
      wordTrig = false,
      regTrig = true,
      dscr = "Auto m subscript"
    },
    fmta("<>_m", {
      f(function(_,snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "([A-Za-z]+[%)%]}]?)nn",
      priority = 100,
      snippetType = "autosnippet",
      wordTrig = false,
      regTrig = true,
      dscr = "Auto n subscript"
    },
    fmta("<>_n", {
      f(function(_,snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex_utils.in_mathzone }
  ),

  -- General subscript
  s(
    {
      trig = "__",
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "General subscript"
    },
    fmta("_{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Restriction
  s(
    {
      trig = "(%a+)|\\",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      dscr = "Restriction"
    },
    fmta("<>_{|<>}<>", { 
      f(function(_,snip)
        return snip.captures[1]
      end),
      i(1), 
      i(0) 
    }),
    { condition = tex_utils.in_mathzone }
  ),
}
