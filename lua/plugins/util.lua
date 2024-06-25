return {
  -- Session management. This saves your session in the background,
  -- keeping track of open buffers, window arrangement, and more.
  -- You can restore sessions when returning through the dashboard.
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = function()
      return {
        { "<leader>rs", function() require("persistence").load() end, desc = "Restore Session" },
        { "<leader>rl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
        { "<leader>rd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
      }
    end,
  },
}
