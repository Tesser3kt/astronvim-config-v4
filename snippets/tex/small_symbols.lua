local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  -- General symbols
  s(
    { trig = "...", snippetType = "autosnippet", dscr = "Ellipsis" },
    t("\\ldots"),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "nf", snippetType = "autosnippet", dscr = "Infinity" },
    t("\\infty"),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "o.", snippetType = "autosnippet", dscr = "Bullet symbol" },
    t("\\bullet"),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "grad", snippetType = "autosnippet", dscr = "Gradient" },
    t("\\nabla"),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    {
      trig = "(%s*)qq",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Quad space" 
    },
    t(" \\quad "),
    { condition = tex_utils.in_mathzone }
  ),

  -- Logic
  s(
    { 
      trig = "(%s*)=>", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Implies"
    },
    t(" \\Rightarrow "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)=<", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Implied by"
    },
    t(" \\Leftarrow "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)iff", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Equivalent"
    },
    t(" \\Leftrightarrow "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)aa", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Wedge"
    },
    t(" \\wedge "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)vv", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Vee"
    },
    t(" \\vee "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "neg", 
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Negation"
    },
    t("\\neg "),
    { condition = tex_utils.in_mathzone }
  ),

  s(
    { 
      trig = "(%s*)AA", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "For all"
    },
    t(" \\forall "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)EE", 
      regTrig = true,
      wordTrig = false,
      priority = 100,
      snippetType = "autosnippet",
      dscr = "Exists"
    },
    t(" \\exists "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)nEE", 
      regTrig = true,
      wordTrig = false,
      priority = 200,
      snippetType = "autosnippet",
      dscr = "Not exists"
    },
    t(" \\nexists "),
    { condition = tex_utils.in_mathzone }
  ),


  -- Equality stuffs
  s(
    { 
      trig = "(%s*)!=", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Not equal"
    },
    t(" \\neq "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)<=", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Less or equal"
    },
    t(" \\leq "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)>=", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Greater or equal"
    },
    t(" \\geq "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)>>", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Much greater"
    },
    t(" \\gg "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)<<", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Much smaller"
    },
    t(" \\ll "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*):=", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Defined"
    },
    t(" \\coloneqq "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)%-=", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Identically equal"
    },
    t(" \\equiv "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)~=", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Isomorphic"
    },
    t(" \\cong "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)~~", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Similar"
    },
    t(" \\sim "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)~%-", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Different isomorphic"
    },
    t(" \\simeq "),
    { condition = tex_utils.in_mathzone }
  ),
  
  -- Operations
  s(
    { 
      trig = "(%s*)%+%-", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Plus minus"
    },
    t(" \\pm "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)%-%+", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Minus plus"
    },
    t(" \\mp "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)%+%+", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Direct sum"
    },
    t(" \\oplus "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)oxx", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      priority = 200,
      dscr = "Tensor product"
    },
    t(" \\otimes "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)oo", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Composition"
    },
    t(" \\circ "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)xx", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Direct product"
    },
    t(" \\times "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)%*%*", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Multiplication"
    },
    t(" \\cdot "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)\\\\\\", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Set minus"
    },
    t(" \\setminus "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)Nn", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Binary intersection"
    },
    t(" \\cap "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)UU", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Binary union"
    },
    t(" \\cup "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)|_|", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Binary disjoint union"
    },
    t(" \\sqcup "),
    { condition = tex_utils.in_mathzone }
  ),

  -- Arrows
  s(
    { 
      trig = "(%s*)->",
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Map arrow"
    },
    t(" \\to "),
    { condition = tex_utils.in_mathzone }
  ), 
  s(
    { 
      trig = "(%s*)to",
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Map arrow"
    },
    t(" \\to "),
    { condition = tex_utils.in_mathzone }
  ),

  s(
    { 
      trig = "(%s*)sur", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Surjection"
    },
    t(" \\twoheadrightarrow "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)inj", 
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Injection"
    },
    t(" \\hookrightarrow "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)!>", 
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Maps to"
    },
    t(" \\mapsto "),
    { condition = tex_utils.in_mathzone }
  ),

  -- Conditions
  s(
    { 
      trig = "(%s*)inn",
      priority = 1000,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Element of"
    },
    t(" \\in "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)notin",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Not element of"
    },
    t(" \\notin "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)cc",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Subset"
    },
    t(" \\subseteq "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)scc",
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Proper subset"
    },
    t(" \\subsetneq "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "([^%^^_])(%s*)ncc",
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Not subset"
    },
    f(function(_,snip)
      return snip.captures[1].." \\nsubseteq "
    end),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)div",
      priority = 100,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Divides"
    },
    t(" \\parallel "),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "([^%^^_])(%s*)ndiv",
      priority = 200,
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Divides not"
    },
    f(function(_,snip)
        return snip.captures[1].." \\nparallel "
    end),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { 
      trig = "(%s*)||",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      dscr = "Set delimiter"
    },
    t(" \\mid "),
    { condition = tex_utils.in_mathzone }
  ),

  -- Weird stuffs
  s(
    {
      trig = "sgn",
      snippetType = "autosnippet",
      dscr = "(-1)^{whatever}"
    },
    fmta("(-1)^{<>}<>", { i(1, "n"), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
}
