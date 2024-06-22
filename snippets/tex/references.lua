return {
  s(
    {
      trig = "href",
      dscr = "Web URL reference."
    },
    fmta("\\href{<>}{<>}<>", {
      i(1, "link"),
      i(2, "text"),
      i(0)
    })
  ),
  s(
    {
      trig = "myref",
      dscr = "My custom reference."
    },
    fmta("\\myref{<>}{<>}<>", {
      i(1, "text"),
      i(2, "link"),
      i(0)
    })
  ),
  s(
    {
      trig = "xref",
      dscr = "Cross reference."
    },
    fmta("\\hyperref[<>]{<>}<>", {
      i(1, "link"),
      i(2, "text"),
      i(0)
    })
  ),
  s(
    {
      trig = "url",
      dscr = "Pure URL reference."
    },
    fmta("\\url{<>}<>", {
      i(1, "link"),
      i(0)
    })
  ),
  s(
    {
      trig = "cite",
      priority = 100,
      dscr = "Insert citation."
    },
    fmta("\\cite{<>}<>", {
      i(1, "link"),
      i(0)
    })
  ),
  s(
    {
      trig = "acite",
      priority = 200,
      dscr = "Insert automatic citation."
    },
    fmta("\\autocite{<>}<>", {
      i(1, "link"),
      i(0)
    })
  ),
  s(
    {
      trig = "eqref",
      dscr = "Equation reference."
    },
    fmta("\\eqref{<>}<>", {
      i(1, "link"),
      i(0)
    })
  ),
  s(
    {
      trig = "(%s+)foot",
      regTrig = true,
      wordTrig = false,
      dscr = "Footnote."
    },
    fmta("~\\footnote{<>}<>", {
      i(1, "link"),
      i(0)
    })
  ),
}
