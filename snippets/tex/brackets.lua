local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  -- Parentheses
  s(
    {
      trig = "()",
      snippetType = "autosnippet",
      dscr = "left right ()"
    },
    fmta("\\left( <> \\right)<>", {
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "lr",
      dscr = "left right ()"
    },
    fmta("\\left( <> \\right)<>", {
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "lr(",
      dscr = "left right ()"
    },
    fmta("\\left( <> \\right)<>", {
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Brackets
  s(
    {
      trig = "lr[",
      dscr = "left right []"
    },
    fmta("\\left[ <> \\right]<>", {
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Braces
  s(
    {
      trig = "set",
      snippetType = "autosnippet",
      dscr = "{}"
    },
    fmta("\\{<>\\}<>", {
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "lr{",
      dscr = "left right {}"
    },
    fmta("\\left\\{ <> \\right\\}<>", {
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "lrb",
      dscr = "left right {}"
    },
    fmta("\\left{ <> \\right}<>", {
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Absolute values
  s(
    {
      trig = "lr|",
      dscr = "left right ||"
    },
    fmta("\\left| <> \\right|<>", {
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Norms
  s(
    {
      trig = "norm",
      snippetType = "autosnippet",
      dscr = "|| ||"
    },
    fmta("\\|<>\\|<>", {
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "lrn",
      dscr = "left right || ||"
    },
    fmta("\\left\\| <> \\right\\|<>", {
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Linear forms
  s(
    {
      trig = "<>",
      snippetType = "autosnippet",
      dscr = "<>"
    },
    fmta("\\langle <> \\rangle<>", {
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "lr<",
      dscr = "left right <>"
    },
    fmta("\\left\\langle <> \\right\\rangle<>", {
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Ceiling/floor
  s(
    {
      trig = "ceil",
      dscr = "left right |^ ^|"
    },
    fmta("\\left\\lceil <> \\right\\rceil<>", {
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "floor",
      dscr = "left right |_ _|"
    },
    fmta("\\left\\lfloor <> \\right\\rfloor<>", {
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_mathzone }
  ),
}
