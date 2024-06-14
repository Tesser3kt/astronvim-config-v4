return {
  {
    "lervag/vimtex",
    event = "BufEnter *.tex",
    cmd = { "VimtexCompile" },
    keys = {
      { "<leader>vc", "<cmd>VimtexCompile<cr>", desc = "Compile opened LaTeX file." },
    }
  }
}
