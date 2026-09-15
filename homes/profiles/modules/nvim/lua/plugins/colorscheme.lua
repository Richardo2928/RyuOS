return {
  "sainnhe/everforest",
  lazy = false,    -- Immediately load
  priority = 1000, -- Max priority
  config = function()
    -- Everforest specific options
    vim.g.everforest_background = "hard"  -- 'Hard', 'Medium', 'Soft'
    vim.g.everforest_better_performance = 1 -- Performance optimization
    -- Apply the theme
    vim.cmd.colorscheme("everforest")
  end
}
