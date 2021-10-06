-- This is where you custom modules and plugins goes.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

-- hooks.add("setup_mappings", function(map)
--    map("n", "<leader>cc", "gg0vG$d", opt) -- example to delete the buffer
--    .... many more mappings ....
-- end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

hooks.add("install_plugins", function(use)
  use {
      "ActivityWatch/aw-watcher-vim",
      event = "VimEnter",
   }
  use {
      "tpope/vim-fugitive",
      cmd = {
         "Git",
         "Gdiff",
         "Gdiffsplit",
         "Gvdiffsplit",
         "Gwrite",
         "Gw",
      },
   }   
   use {
      "andweeb/presence.nvim",
      event = "VimEnter",
   }
   use {
     "ThePrimeagen/vim-be-good",
     cmd = {"VimBeGood"}
   }
   use {
     "folke/twilight.nvim",
     cmd = {"Twilight", "TwilightEnable", "TwilightDisable"}
   }
   -- use {
   --         "simrat39/rust-tools.nvim"
   -- }
   use {"jvgrootveld/telescope-zoxide"}

   -- use {
   --   "williamboman/nvim-lsp-installer",
   --    config = function()
   --            local lsp_installer = require "nvim-lsp-installer"
   --       lsp_installer.on_server_ready(function(server)
   --               local opts = {}
   --          server:setup(opts)
   --          vim.cmd [[ do User LspAttachBuffers ]]
   --  end)
   --  end,
   --    }
end)

hooks.add("setup_mappings", function(map)
    map("n", "<leader>gs", ":Git<CR>")
    map("n", "<leader>gbl", ":Git blame<CR>")
    map("n", "<leader>gpl", ":Git pull<CR>")
    map("n", "<leader>gph", ":Git push<CR>")
    map("n", "<leader>gc", ":Git commit<CR>")
    map("n", "<leader>gm", ":Git merge<CR>")
    map("n", "<leader>grb", ":Git rebase<CR>")
    map("n", "<leader>gl", ":Telescope git_commits<CR>")
    map("n", "<leader>gbc", ":Telescope git_branches<CR>")
    map("n", "<leader>gu", ":Telescope git_status<CR>")
    map("n", "<leader>zi", ":Telescope zoxide list<CR>")
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
