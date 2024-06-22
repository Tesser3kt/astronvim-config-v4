-- [[ Beamer specific snippets ]]

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
  -- Frame snippet
  s(
    { 
      trig = "frm", 
      dscr = "Beamer frame",
    },
    fmta(
      [[
        \begin{frame}
         \frametitle{<>}
         <>
        \end{frame}
      ]],
      {
        i(1),
        i(0)
      }
    )
  ),
  -- Block snippet
  s(
    { 
      trig = "blk", 
      dscr = "Beamer block",
    },
    fmta(
      [[
        \begin{block}{<>}
         <>
        \end{block}
      ]],
      {
        i(1),
        i(0)
      }
    )
  ),
}

