-- [[ Contains snippets for generic and specific environments. ]]

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
  print(plainLabel)

  for accented, plain in pairs(toLabel) do
    plainLabel = plainLabel:gsub(accented, plain)
  end
  return plainLabel:gsub("[^%a-']", "")
end

-- Some environment conditions.
local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function()  -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function()  -- equation environment detection
    return tex_utils.in_env('equation')
end
tex_utils.in_item_or_enum = function()  -- itemize or enumerate environment detection
    return tex_utils.in_env('itemize') or tex_utils.in_env('enumerate')
end
tex_utils.in_tikz = function()  -- TikZ picture environment detection
    return tex_utils.in_env('tikzpicture')
end
tex_utils.in_split = function() -- Equation split environment detection
    return tex_utils.in_env('split')
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Get visual selection text
local get_visual = function(args, parent)
  if (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else  -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

-- Snippets
return {
  -- Inline and display math snippets
  s(
    { trig = "([%s%(%[%{]+)mk", 
      dscr = "Inline math environment.",
      snippetType = "autosnippet",
      wordTrig = false,
      regTrig = true
    },
    fmta(
      "<>$<>$<>",
      { 
        f(function(_,snip)
          return snip.captures[1]
        end),
        d(1, get_visual),
        i(0) 
      }
    )
  ),
  s(
    { trig = "mk", 
      dscr = "Inline math environment (newline version).",
      snippetType = "autosnippet"
    },
    fmta(
      "$<>$<>",
      { 
        d(1, get_visual),
        i(0) 
      }
    ),
    { condition = line_begin }
  ),
  s(
   { trig = "md", snippetType = "autosnippet", dscr = "Display math environment." },
   fmta(
    [[
      \[
       <>
      \]
      <>
    ]],
    {
      i(1),
      i(0)
    }
   ),
   { condition = line_begin }
  ),

  -- Generic environment snippet
  s(
    { trig = "beg", dscr = "Generic environment." },
    fmta(
      [[
        \begin{<>}
         <>
        \end{<>}
      ]],
      {
        i(1),
        i(0),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),

  -- Enumerate and itemize environment
  s(
    { trig = "ben", dscr = "Enumerate environment with options." },
    fmta(
      [[
        \begin{enumerate}<><><>
         \item <>
        \end{enumerate}
      ]],
      {
        f(function(args) return string.len(args[1][1]) > 0 and "[" or "" end, {1}),
        i(1),
        f(function(args) return string.len(args[1][1]) > 0 and "]" or "" end, {1}),
        i(0)
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "bit", dscr = "Itemize environment with options." },
    fmta(
      [[
        \begin{itemize}<><><>
         \item <>
        \end{itemize}
      ]],
      {
        f(function(args) return string.len(args[1][1]) > 0 and "[" or "" end, {1}),
        i(1),
        f(function(args) return string.len(args[1][1]) > 0 and "]" or "" end, {1}),
        i(0)
      }
    ),
    { condition = line_begin }
  ),
  -- Next item snippet
  s(
    { trig = "(%s+)ii", regTrig = true, wordTrig = false, snippetType = "autosnippet",
      dscr = "Next item snippet." },
    fmta(
      "<>\\item <>",
      {
        f(function(_, snip)
          local spaces = string.len(snip.captures[1])
          return string.rep("\t", spaces - 1)
        end),
        i(0) 
      }),
    { condition = line_begin and tex_utils.in_item_or_enum }
  ),

  -- Figure and TikZ environments
  s(
    { trig = "fig", dscr = "Figure environment." },
    fmta(
      [[
        \begin{figure}[<>]
         \centering
         <>

         \caption{<>}
         \label{fig:<>}
        \end{figure}
      ]],
      {
        i(1, "htbp"),
        i(0),
        i(2),
        i(3),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "tikz", dscr = "TikZ environment inside figure." },
    fmta(
      [[
        \begin{figure}[<>]
         \centering
         \begin{tikzpicture}
          <>
         \end{tikzpicture}

         \caption{<>}
         \label{fig:<>}
        \end{figure}
      ]],
      {
        i(1, "htbp"),
        i(0),
        i(2),
        i(3),
      }
    ),
    { condition = line_begin }
  ),

  -- Table environment
  s(
    { trig = "table", dscr = "Table environment." },
    fmta(
      [[
        \begin{table}[<>]
         \centering
         <>

         \caption{<>}
         \label{table:<>}
        \end{table}
      ]],
      {
        i(1, "htbp"),
        i(0),
        i(2),
        i(3),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "tabular", dscr = "Tabularx environment." },
    fmta(
      [[
        \begin{table}[<>]
         \centering
         \begin{tabular}{<>}
          <>
         \end{tabular}
         \caption{<>}
         \label{table:<>}
        \end{table}
      ]],
      {
        i(1, "htbp"),
        i(2),
        i(0),
        i(3),
        i(4)
      }
    ),
    { condition = line_begin }
  ),

  -- Equation environments
  s(
    { trig = "eq", dscr = "Labeled equation environment." },
    fmta(
      [[
        \begin{equation}
         \label{eq:<>}
         <>
        \end{equation}
      ]],
      {
        i(1),
        i(0)
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "eq*", dscr = "Unlabeled equation environment." },
    fmta(
      [[
        \begin{equation*}
         <>
        \end{equation*}
      ]],
      {
        i(0)
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "split", dscr = "Split equation environment." },
    fmta(
      [[
        \begin{equation*}
         \begin{split}
          <>
         \end{split}
        \end{equation*}
      ]],
      {
        i(0)
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "case", dscr = "Cases environment "},
    fmta(
      [[
        \begin{cases}
         <>
        \end{cases}
        <>
      ]],
      {
        i(1),
        i(0)
      }
    )
  ),
  s(
   { trig = "==",
     snippetType = "autosnippet",
     dscr = "Split align to = snippet." },
   fmta("&= <> \\\\<>",
   { 
     i(1),
     i(0) 
   }),
   { condition = tex_utils.in_split }
  ),

  -- Theorem environments
  s(
    {trig = "thm", dscr = "Theorem environment" },
    fmta(
      [[
        \begin{theorem}{<>}{<><>}
         <>
        \end{theorem}
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(2),
        i(0)
      }
    )
  ),
  s(
    {trig = "prop", dscr = "Proposition environment" },
    fmta(
      [[
        \begin{proposition}{<>}{<><>}
         <>
        \end{proposition}
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(2),
        i(0)
      }
    )
  ),
  s(
    {trig = "lem", dscr = "Lemma environment" },
    fmta(
      [[
        \begin{lemma}{<>}{<><>}
         <>
        \end{lemma}
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(2),
        i(0)
      }
    )
  ), 
  s(
    {trig = "obs", dscr = "Observation environment" },
    fmta(
      [[
        \begin{observation}{<>}{<><>}
         <>
        \end{observation}
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(2),
        i(0)
      }
    )
  ),
  s(
    {trig = "cor", dscr = "Corollary environment" },
    fmta(
      [[
        \begin{corollary}{<>}{<><>}
         <>
        \end{corollary}
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(2),
        i(0)
      }
    )
  ),
  s(
    {trig = "prob", dscr = "Problem environment" },
    fmta(
      [[
        \begin{problem}{<>}{<><>}
         <>
        \end{problem}
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(2),
        i(0)
      }
    )
  ),
  s(
    {trig = "def", dscr = "Definition environment" },
    fmta(
      [[
        \begin{definition}{<>}{<><>}
         <>
        \end{definition}
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(2),
        i(0)
      }
    )
  ),
  s(
    {trig = "exam", dscr = "Example environment" },
    fmta(
      [[
        \begin{example}{<>}{<><>}
         <>
        \end{example}
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(2),
        i(0)
      }
    )
  ),
  s(
    {trig = "rmrk", dscr = "Remark environment" },
    fmta(
      [[
        \begin{remark}{<>}{<><>}
         <>
        \end{remark}
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(2),
        i(0)
      }
    )
  ),
  s(
    {trig = "warn", dscr = "Warning environment" },
    fmta(
      [[
        \begin{warning}{<>}{<><>}
         <>
        \end{warning}
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(2),
        i(0)
      }
    )
  ),
  s(
    {trig = "exer", dscr = "Exercise environment" },
    fmta(
      [[
        \begin{exercise}{<>}{<><>}
         <>
        \end{exercise}
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(2),
        i(0)
      }
    )
  ),
  s(
    {trig = "prob", dscr = "Problem environment" },
    fmta(
      [[
        \begin{problem}{<>}{<><>}
         <>
        \end{problem}
      ]],
      {
        i(1),
        f(function(args) return labelize(args[1][1]) end, {1}),
        i(2),
        i(0)
      }
    )
  ),


  -- s(
  --   {trig = "thm", dscr = "Theorem environment" },
  --   fmta(
  --     [[
  --       \begin{theorem}<><><>
  --        \label{thm:<><>}
  --        <>
  --       \end{theorem}
  --     ]],
  --     {
  --       f(function(args) return string.len(args[1][1]) > 0 and "[" or "" end, {1}),
  --       i(1),
  --       f(function(args) return string.len(args[1][1]) > 0 and "]" or "" end, {1}),
  --       i(2),
  --       f(function(args) return labelize(args[1][1]) end, {1}),
  --       i(0)
  --     }
  --   )
  -- ),
  -- s(
  --   {trig = "prop", dscr = "Proposition environment" },
  --   fmta(
  --     [[
  --       \begin{proposition}<><><>
  --        \label{prop:<><>}
  --        <>
  --       \end{proposition}
  --     ]],
  --     {
  --       f(function(args) return string.len(args[1][1]) > 0 and "[" or "" end, {1}),
  --       i(1),
  --       f(function(args) return string.len(args[1][1]) > 0 and "]" or "" end, {1}),
  --       i(2),
  --       f(function(args) return labelize(args[1][1]) end, {1}),
  --       i(0)
  --     }
  --   )
  -- ),
  -- s(
  --   { trig = "claim", dscr = "Claim environment" },
  --   fmta(
  --     [[
  --       \begin{claim}<><><>
  --        \label{claim:<><>}
  --        <>
  --       \end{claim}
  --     ]],
  --     {
  --       f(function(args) return string.len(args[1][1]) > 0 and "[" or "" end, {1}),
  --       i(1),
  --       f(function(args) return string.len(args[1][1]) > 0 and "]" or "" end, {1}),
  --       i(2),
  --       f(function(args) return labelize(args[1][1]) end, {1}),
  --       i(0)
  --     }
  --   )
  -- ),
  -- s(
  --   {trig = "lem", dscr = "Lemma environment" },
  --   fmta(
  --     [[
  --       \begin{lemma}<><><>
  --        \label{lem:<><>}
  --        <>
  --       \end{lemma}
  --     ]],
  --     {
  --       f(function(args) return string.len(args[1][1]) > 0 and "[" or "" end, {1}),
  --       i(1),
  --       f(function(args) return string.len(args[1][1]) > 0 and "]" or "" end, {1}),
  --       i(2),
  --       f(function(args) return labelize(args[1][1]) end, {1}),
  --       i(0)
  --     }
  --   )
  -- ),
  -- s(
  --   {trig = "def", dscr = "Definition environment" },
  --   fmta(
  --     [[
  --       \begin{definition}<><><>
  --        \label{def:<><>}
  --        <>
  --       \end{definition}
  --     ]],
  --     {
  --       f(function(args) return string.len(args[1][1]) > 0 and "[" or "" end, {1}),
  --       i(1),
  --       f(function(args) return string.len(args[1][1]) > 0 and "]" or "" end, {1}),
  --       i(2),
  --       f(function(args) return labelize(args[1][1]) end, {1}),
  --       i(0)
  --     }
  --   )
  -- ),
  -- s(
  --   {trig = "cor", dscr = "Corollary environment" },
  --   fmta(
  --     [[
  --       \begin{corollary}<><><>
  --        \label{cor:<><>}
  --        <>
  --       \end{corollary}
  --     ]],
  --     {
  --       f(function(args) return string.len(args[1][1]) > 0 and "[" or "" end, {1}),
  --       i(1),
  --       f(function(args) return string.len(args[1][1]) > 0 and "]" or "" end, {1}),
  --       i(2),
  --       f(function(args) return labelize(args[1][1]) end, {1}),
  --       i(0)
  --     }
  --   )
  -- ),
  -- s(
  --   {trig = "exer", dscr = "Exercise environment." },
  --   fmta(
  --     [[
  --       \begin{exercise}<><><>
  --        <>
  --       \end{exercise}
  --     ]],
  --     {
  --       f(function(args) return string.len(args[1][1]) > 0 and "[" or "" end, {1}),
  --       i(1),
  --       f(function(args) return string.len(args[1][1]) > 0 and "]" or "" end, {1}),
  --       i(0)
  --     }
  --   )
  -- ),
  -- s(
  --   {trig = "prob", dscr = "Problem environment" },
  --   fmta(
  --     [[
  --       \begin{problem}<><><>
  --        \label{prob:<><>}
  --        <>
  --       \end{problem}
  --     ]],
  --     {
  --       f(function(args) return string.len(args[1][1]) > 0 and "[" or "" end, {1}),
  --       i(1),
  --       f(function(args) return string.len(args[1][1]) > 0 and "]" or "" end, {1}),
  --       i(2),
  --       f(function(args) return labelize(args[1][1]) end, {1}),
  --       i(0)
  --     }
  --   )
  -- ),
  -- s(
  --   {trig = "exam", dscr = "Example environment" },
  --   fmta(
  --     [[
  --       \begin{example}<><><>
  --        \label{exam:<><>}
  --        <>
  --       \end{example}
  --     ]],
  --     {
  --       f(function(args) return string.len(args[1][1]) > 0 and "[" or "" end, {1}),
  --       i(1),
  --       f(function(args) return string.len(args[1][1]) > 0 and "]" or "" end, {1}),
  --       i(2),
  --       f(function(args) return labelize(args[1][1]) end, {1}),
  --       i(0)
  --     }
  --   )
  -- ),
  --
  -- -- Plain theorem environments
  -- s(
  --   {trig = "rmrk", dscr = "Remark environment" },
  --   fmta(
  --     [[
  --       \begin{remark}
  --        <>
  --       \end{remark}
  --     ]],
  --     {
  --       i(0)
  --     }
  --   )
  -- ),
  -- s(
  --   {trig = "prf", dscr = "Proof environment" },
  --   fmta(
  --     [[
  --       \begin{proof}
  --        <>
  --       \end{proof}
  --     ]],
  --     {
  --       i(0)
  --     }
  --   )
  -- ),
  -- s(
  --   {trig = "warn", dscr = "Warning environment" },
  --   fmta(
  --     [[
  --       \begin{warning}
  --        <>
  --       \end{warning}
  --     ]],
  --     {
  --       i(0)
  --     }
  --   )
  -- ),
  -- s(
  --   {trig = "obs", dscr = "Observation environment" },
  --   fmta(
  --     [[
  --       \begin{observation}
  --        <>
  --       \end{observation}
  --     ]],
  --     {
  --       i(0)
  --     }
  --   )
  -- ),

  -- Matrices
  s(
    {
      trig = "pmat",
      priority = 200,
      dscr = "Parenthesis matrix"
    },
    fmta([[
      \begin{pmatrix}
       <>
      \end{pmatrix}
      <>
    ]],
    {
      i(1),
      i(0)
    }),
    { condition = line_begin }
  ),
  s(
    {
      trig = "mat",
      priority = 100,
      dscr = "Brackets matrix"
    },
    fmta([[
      \begin{bmatrix}
       <>
      \end{bmatrix}
      <>
    ]],
    {
      i(1),
      i(0)
    }),
    { condition = line_begin }
  ),

  -- Algorithms
  s(
    {
      trig = "alg",
      dscr = "Algorithm environment."
    },
    fmta([[
      \begin{algorithm}
        \caption{<>}
        \label{alg:<>}

        \SetKwInOut{Input}{input}
        \SetKwInOut{Output}{output}
        \SetKw{KwReturn}{return}

        \Input{<>}
        \Output{<>}
        \BlankLine
        <>
      \end{algorithm}
    ]],
    { i(1), i(2), i(3), i(4), i(0) }),
    { condition = line_begin }
  ),
}

