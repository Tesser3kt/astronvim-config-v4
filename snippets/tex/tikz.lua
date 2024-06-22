-- [[ Contains TikZ specific snippets. ]] --
local tex_utils = {}
tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
tex_utils.in_tikz = function()  -- TikZ picture environment detection
    return tex_utils.in_env('tikzpicture')
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  -- General snippets
  s(
    {
      trig = "nd",
      priority = 100,
      snippetType = "autosnippet",
      desc = "Node with absolute position."
    },
    fmta(
      [[
        \node<><><><><><> at (<>) {<>};
        <>
      ]],
      {
        f(function(args) return string.len(args[1][1]) > 0 and "[" or "" end, {1}),
        i(1),
        f(function(args) return string.len(args[1][1]) > 0 and "]" or "" end, {1}),
        f(function(args) return string.len(args[1][1]) > 0 and " (" or "" end, {2}),
        i(2),
        f(function(args) return string.len(args[1][1]) > 0 and ")" or "" end, {2}),
        i(3),
        i(4),
        i(0)
      }
    ),
    { condition = tex_utils.in_tikz and line_begin }
  ),
  s(
    {
      trig = "rnd",
      priority = 200,
      snippetType = "autosnippet",
      desc = "Node with relative position."
    },
    fmta(
      [[
        \node[<>]<><><> {<>};
        <>
      ]],
      {
        i(1),
        f(function(args) return string.len(args[1][1]) > 0 and " (" or "" end, {2}),
        i(2),
        f(function(args) return string.len(args[1][1]) > 0 and ")" or "" end, {2}),
        i(3),
        i(0)
      }
    ),
    { condition = tex_utils.in_tikz and line_begin }
  ),
  s(
    { trig = "dd",
      snippetType = "autosnippet",
      priority = 100,
      dscr = "Simple draw snippet."
    },
    fmta(
      [[
        \draw<><><> (<>) -- (<>);
        <>
      ]],
      {
        f(function(args) return string.len(args[1][1]) > 0 and "[" or "" end, {1}),
        i(1),
        f(function(args) return string.len(args[1][1]) > 0 and "]" or "" end, {1}),
        i(2),
        i(3),
        i(0)
      }
    ),
    { condition = tex_utils.in_tikz and line_begin }
  ),
  s(
    { trig = "rdd",
      snippetType = "autosnippet",
      priority = 200,
      dscr = "Draw snippet with midway node."
    },
    fmta(
      [[
        \draw<><><> (<>) to node[<>] {<>} (<>);
        <>
      ]],
      {
        f(function(args) return string.len(args[1][1]) > 0 and "[" or "" end, {1}),
        i(1),
        f(function(args) return string.len(args[1][1]) > 0 and "]" or "" end, {1}),
        i(2),
        i(3, "midway"),
        i(4),
        i(5),
        i(0)
      }
    ),
    { condition = tex_utils.in_tikz and line_begin }
  ),
  
  -- Graph specific stuffs
  s(
    {
      trig = "vx",
      priority = 100,
      snippetType = "autosnippet",
      desc = "Vertex with absolute position."
    },
    fmta(
      [[
        \node[vertex<>]<><><> at (<>) {<>};
        <>
      ]],
      {
        i(1),
        f(function(args) return string.len(args[1][1]) > 0 and " (" or "" end, {2}),
        i(2),
        f(function(args) return string.len(args[1][1]) > 0 and ")" or "" end, {2}),
        i(3),
        i(4),
        i(0)
      }
    ),
    { condition = tex_utils.in_tikz and line_begin }
  ),
  s(
    {
      trig = "rvx",
      priority = 200,
      snippetType = "autosnippet",
      desc = "Vertex with relative position."
    },
    fmta(
      [[
        \node[vertex<>]<><><> {<>};
        <>
      ]],
      {
        i(1),
        f(function(args) return string.len(args[1][1]) > 0 and " (" or "" end, {2}),
        i(2),
        f(function(args) return string.len(args[1][1]) > 0 and ")" or "" end, {2}),
        i(3),
        i(0)
      }
    ),
    { condition = tex_utils.in_tikz and line_begin }
  ),
  s(
    { trig = "dg",
      snippetType = "autosnippet",
      priority = 100,
      dscr = "Simple edge snippet."
    },
    fmta(
      [[
        \draw[thick<>] (<>) -- (<>);
        <>
      ]],
      {
        i(1),
        i(2),
        i(3),
        i(0)
      }
    ),
    { condition = tex_utils.in_tikz and line_begin }
  ),
  s(
    { trig = "rdg",
      snippetType = "autosnippet",
      priority = 200,
      dscr = "Midway node edge snippet."
    },
    fmta(
      [[
        \draw[thick<>] (<>) to node[<>] {<>} (<>);
        <>
      ]],
      {
        i(1),
        i(2),
        i(3, "midway"),
        i(4),
        i(5),
        i(0)
      }
    ),
    { condition = tex_utils.in_tikz and line_begin }
  ),
  s(
    { trig = "wdg",
      snippetType = "autosnippet",
      priority = 200,
      dscr = "Weighted edge snippet."
    },
    fmta(
      [[
        \draw[thick<>] (<>) to node[midway,circle,draw,fill=white,inner sep=1pt]
         {\footnotesize $<>$} (<>);
        <>
      ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
        i(0)
      }
    ),
    { condition = tex_utils.in_tikz and line_begin }
  ),
}
