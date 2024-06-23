local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_tikzcd = function()  -- TikZ picture environment detection
    return tex_utils.in_env('tikzcd')
end

function toGreek(letter)
  local romanToGreek = {
    ["a"] = "alpha",
    ["b"] = "beta",
    ["c"] = "chi",
    ["d"] = "delta",
    ["e"] = "varepsilon",
    ["f"] = "varphi",
    ["g"] = "gamma",
    ["h"] = "eta",
    ["i"] = "iota",
    ["j"] = "eta",
    ["k"] = "kappa",
    ["l"] = "lambda",
    ["m"] = "mu",
    ["n"] = "nu",
    ["p"] = "pi",
    ["r"] = "rho",
    ["s"] = "sigma",
    ["t"] = "tau",
    ["u"] = "psi",
    ["v"] = "theta",
    ["w"] = "omega",
    ["x"] = "xi",
    ["y"] = "upsilon",
    ["z"] = "zeta",
    ["D"] = "Delta",
    ["V"] = "Theta",
    ["L"] = "Lambda",
    ["G"] = "Gamma",
    ["X"] = "Xi",
    ["P"] = "Pi",
    ["S"] = "Sigma",
    ["F"] = "Phi",
    ["U"] = "Psi",
    ["W"] = "Omega"
  }

  if romanToGreek[letter] ~= nil then
    return "\\"..romanToGreek[letter]
  else
    return ";"..letter
  end
end

return {
  s(
    { trig = ";(%a+)", regTrig = true, wordTrig = false,
    snippetType = "autosnippet", dscr = "Greek letters." },
    f(function(_, snip) return toGreek(snip.captures[1]) end),
    { condition = tex_utils.in_mathzone or tex_utils.in_tikzcd }
  )
}
