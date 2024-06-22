-- [[ Contains snippets for parts, chapters, sections, subsections and subsubsections. ]]

function labelize(label)
  local toLabel = {
    ["á"] = "a",
    ["č"] = "c",
    ["ď"] = "d",
    ["é"] = "e", ["ě"] = "e",
    ["í"] = "i",
    ["ň"] = "n",
    ["ó"] = "o",
    ["ř"] = "r",
    ["š"] = "s",
    ["ť"] = "t",
    ["ú"] = "u", ["ů"] = "u",
    ["ý"] = "y",
    ["ž"] = "z"
  }

  local plainLabel = label:lower():gsub("%s+", "-")

  for accented, plain in pairs(toLabel) do
    plainLabel = plainLabel:gsub(accented, plain)
  end
  return plainLabel:gsub("[^%a-']", "")
end
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return { 
  -- Part snippet
  s(
    { trig = "part", dscr = "Part snippet with auto label." },
    fmta(
      [[
        \part{<>}
        \label{part:<>}

        <>
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(0),
      }
    ),
    { condition = line_begin }
  ),
  -- Chapter snippet
  s(
    { trig = "chap", dscr = "Chapter snippet with auto label." },
    fmta(
      [[
        \chapter{<>}
        \label{chap:<>}

        <>
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(0),
      }
    ),
    { condition = line_begin }
  ),
  -- Section snippet
  s(
    { trig = "sec", dscr = "Section snippet with auto label." },
    fmta(
      [[
        \section{<>}
        \label{sec:<>}

        <>
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(0),
      }
    ),
    { condition = line_begin }
  ),
  -- Subsection snippet
  s(
    { trig = "ssec", dscr = "Subsection snippet with auto label." },
    fmta(
      [[
        \subsection{<>}
        \label{ssec:<>}

        <>
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(0),
      }
    ),
    { condition = line_begin }
  ),
  -- Subsubsection snippet
  s(
    { trig = "sssec", dscr = "Subsubsection snippet with auto label." },
    fmta(
      [[
        \subsubsection{<>}
        \label{sssec:<>}

        <>
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(0),
      }
    ),
    { condition = line_begin }
  ),
}

