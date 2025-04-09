-- [[ General Typst snippets ]]

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Get visual selection text
local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

-- Snippets
return {
  -- Inline and display math snippets
  s(
    {
      trig = "([%s%(%[%{]+)mk",
      dscr = "Inline math environment.",
      snippetType = "autosnippet",
      wordTrig = false,
      regTrig = true,
    },
    fmta("<>$<>$<>", {
      f(function(_, snip) return snip.captures[1] end),
      d(1, get_visual),
      i(0),
    })
  ),
  s(
    { trig = "mk", dscr = "Inline math environment (newline version).", snippetType = "autosnippet" },
    fmta("$<>$<>", {
      d(1, get_visual),
      i(0),
    }),
    { condition = line_begin }
  ),
  s(
    { trig = "md", snippetType = "autosnippet", dscr = "Display math environment." },
    fmta(
      [[
      #align(center)[
       $<>$
      ]
      <>
    ]],
      {
        i(1),
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- Text coloring snippets
  s(

    {
      trig = "cl(%l+)",
      regTrig = "true",
      wordTrig = "false",
      dscr = "Text color",
    },
    fmta("#cl<>[<>]<>", {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
      i(0),
    })
  ),
}
