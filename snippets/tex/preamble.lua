local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  s(
    {
      trig = "pac",
      dscr = "usepackage snippet"
    },
    fmta("\\usepackage<><><>{<>}<>", {
      f(function(args)
        if string.len(args[1][1]) > 0 then return "[" end
      end, {1}),
      i(1),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "]" end
      end, {1}),
      i(2),
      i(0)
    })
  ),
  s(
    {
      trig = "docclass",
      dscr = "Document class snippet"
    },
    fmta("\\documentclass<><><>{<>}<>", {
      f(function(args)
        if string.len(args[1][1]) > 0 then return "[" end
      end, {1}),
      i(1),
      f(function(args)
        if string.len(args[1][1]) > 0 then return "]" end
      end, {1}),
      i(2),
      i(0)
    })
  ),
}
