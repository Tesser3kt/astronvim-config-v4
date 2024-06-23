-- Tikz-CD specific snippets
local tex_utils = {}
tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
tex_utils.in_tikzcd = function()  -- TikZ picture environment detection
    return tex_utils.in_env('tikzcd')
end

return {
  s(
    {
      trig = "dot",
      snippetType = "autosnippet",
      dscr = "Bullet symbol"
    },
    t("\\bullet "),
    { condition = tex_utils.in_tikzcd }
  ),
  s(
    {
      trig = "ar",
      snippetType = "autosnippet",
      dscr = "Arrow",
    },
    fmta("\\ar[<><><><>] <>", {
      i(1, "urdl"),
      f(function(args) return string.len(args[1][1]) > 0 and ',"' or '' end, {2}),
      i(2),
      f(function(args) return string.len(args[1][1]) > 0 and '"' or '' end, {2}),
      i(0)
    }),
    { condition = tex_utils.in_tikzcd }
  ),
}
