local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  -- Empty Set
  s(
    {
      trig = "OO",
      snippetType = "autosnippet",
      wordTrig = false,
      dscr = "Empty set"
    },
    t("\\emptyset"),
    { condition = tex_utils.in_mathzone }
  ),

  -- Semirings
  s(
    {
      trig = "NN",
      snippetType = "autosnippet",
      wordTrig = false,
      dscr = "Natural numbers"
    },
    t("\\N"),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "RR",
      snippetType = "autosnippet",
      wordTrig = false,
      dscr = "Real numbers"
    },
    t("\\R"),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "CC",
      snippetType = "autosnippet",
      wordTrig = false,
      dscr = "Complex numbers"
    },
    t("\\C"),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "KK",
      snippetType = "autosnippet",
      wordTrig = false,
      dscr = "Field"
    },
    t("\\K"),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "FF",
      snippetType = "autosnippet",
      wordTrig = false,
      dscr = "Finite field"
    },
    t("\\F"),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "QQ",
      snippetType = "autosnippet",
      wordTrig = false,
      dscr = "Rational numbers"
    },
    t("\\Q"),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "ZZ",
      snippetType = "autosnippet",
      wordTrig = false,
      dscr = "Integers"
    },
    t("\\Z"),
    { condition = tex_utils.in_mathzone }
  ),

  -- Algebraic Geometry
  s(
    {
      trig = "II",
      snippetType = "autosnippet",
      wordTrig = false,
      dscr = "Ideal"
    },
    t("\\I"),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "VV",
      snippetType = "autosnippet",
      wordTrig = false,
      dscr = "Zero set"
    },
    t("\\V"),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "DD",
      snippetType = "autosnippet",
      wordTrig = false,
      dscr = "Zariski open set"
    },
    t("\\D"),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "PP",
      snippetType = "autosnippet",
      wordTrig = false,
      dscr = "Projective plane"
    },
    t("\\P"),
    { condition = tex_utils.in_mathzone }
  ),
}
