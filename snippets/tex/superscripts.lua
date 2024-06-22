local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  -- Typical powers
  s(
    {
      trig = "sr",
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Squared"
    },
    t("^2"),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "cb",
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Cubed"
    },
    t("^3"),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "inv",
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Inverse"
    },
    t("^{-1}"),
    { condition = tex_utils.in_mathzone }
  ),

  -- General superscripts
  s(
    {
      trig = "td",
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "General superscript"
    },
    fmta("^{<>}<>", { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "rd",
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "N-th derivative"
    },
    fmta("^{(<>)}<>", { i(1, "n"), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
}
