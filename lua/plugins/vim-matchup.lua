return {
  {
    'andymass/vim-matchup', 
     event = { "BufReadPost" }, 
     init = function() 
         vim.o.matchpairs = "(:),{:},[:]" 
     end, 
     config = function()
         -- ...
     end
  },
}
