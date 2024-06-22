-- [[ Algorithm environment specific snippets ]] --
local tex_utils = {}
tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
tex_utils.in_alg = function() -- Algorithm environment detection
    return tex_utils.in_env('algorithm')
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  -- General stuff
  s(
    {
      trig = ";;",
      snippetType = "autosnippet",
      dscr = "End of line semicolon."
    },
    t("\\;"),
    { condition = tex_utils.in_alg }
  ),
  s(
    {
      trig = "\\\\",
      snippetType = "autosnippet",
      dscr = "Blank line."
    },
    t("\\BlankLine"),
    { condition = tex_utils.in_alg and line_begin }
  ),
  s(
    {
      trig = "(%s*):=",
      snippetType = "autosnippet",
      regTrig = true,
      wordTrig = false,
      dscr = "Variable value assignment."
    },
    t(" \\leftarrow "),
    { condition = tex_utils.in_alg }
  ),

  -- Keywords
  s(
    {
      trig = "kw",
      dscr = "Set new keyword."
    },
    fmta("\\SetKw{<>}{<>}<>",
    {
      f(function(args)
        return "Kw"..args[1][1]:gsub("^%l", string.upper)
      end, {1}),
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_alg and line_begin }
  ),
  s(
    {
      trig = "kwio",
      dscr = "Set new input output keyword."
    },
    fmta("\\SetKwInOut{<>}{<>}<>",
    {
      f(function(args)
        return args[1][1]:gsub("^%l", string.upper)
      end, {1}),
      i(1),
      i(0)
    }),
    { condition = tex_utils.in_alg and line_begin }
  ),

  -- Loops and conditions
  s(
    {
      trig = "if",
      dscr = "If statement."
    },
    fmta([[
      \If{<>} {
       <>
      }
    ]],
    { i(1), i(0) }),
    { condition = tex_utils.in_alg and line_begin }
  ),
  s(
    {
      trig = "elif",
      dscr = "Else if statement."
    },
    fmta([[
      \ElseIf{<>} {
       <>
      }
    ]],
    { i(1), i(0) }),
    { condition = tex_utils.in_alg and line_begin }
  ),
  s(
    {
      trig = "else",
      dscr = "Else statement."
    },
    fmta([[
      \Else{<>} {
       <>
      }
    ]],
    { i(1), i(0) }),
    { condition = tex_utils.in_alg and line_begin }
  ),
  s(
    {
      trig = "for",
      dscr = "For loop."
    },
    fmta([[
      \For{<>} {
       <>
      }
    ]],
    { i(1), i(0) }),
    { condition = tex_utils.in_alg and line_begin }
  ),
  s(
    {
      trig = "while",
      dscr = "While loop."
    },
    fmta([[
      \While{<>} {
       <>
      }
    ]],
    { i(1), i(0) }),
    { condition = tex_utils.in_alg and line_begin }
  ),
}
