return {
  {
    "kaarmu/typst.vim",
    event = "BufEnter *.typst",
    cmd = { "TypstWatch" },
    lazt = false,
    ft = "typst",
    keys = {
      { "<leader>tw", "<cmd>TypstWatch<cr>", desc = "Watch opened Typst file." },
    },
  },
}
