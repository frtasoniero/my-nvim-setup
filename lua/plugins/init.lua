return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function ()
      local mason_registry = require('mason-registry')
      local codelldb = mason_registry.get_package("codelldb")
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
      local cfg = require('rustaceanvim.config')

      vim.g.rustaceanvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end
  },

  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require("dap")
		  local dapui = require("dapui")
	  	dap.listeners.before.attach.dapui_config = function()
		  	dapui.open()
		  end
  		dap.listeners.before.launch.dapui_config = function()
	  		dapui.open()
	  	end
		  dap.listeners.before.event_terminated.dapui_config = function()
		  	dapui.close()
		  end
		  dap.listeners.before.event_exited.dapui_config = function()
		  	dapui.close()
		  end
  	end,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
      require("dapui").setup()
    end
  },

  {
    'rust-lang/rust.vim',
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },

  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true
          },
        },
      }
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
    end
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css",
        "rust"
  		},
  	},
  },

  {
    "folke/noice.nvim",
	  event = "VeryLazy",
	  opts = {
		  -- add any options here
	  },
    dependencies = {
		  -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		  "MunifTanjim/nui.nvim",
		  -- OPTIONAL:
		  --   `nvim-notify` is only needed, if you want to use the notification view.
		  --   If not available, we use `mini` as the fallback
		  "rcarriga/nvim-notify",
	  },
    config = function()
		  require("noice").setup({
			  lsp = {
				  -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				  override = {
					  ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					  ["vim.lsp.util.stylize_markdown"] = true,
					  ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				  },
			  },
			  -- you can enable a preset for easier configuration
			  presets = {
				  bottom_search = true, -- use a classic bottom cmdline for search
				  command_palette = true, -- position the cmdline and popupmenu together
				  long_message_to_split = true, -- long messages will be sent to a split
				  inc_rename = false, -- enables an input dialog for inc-rename.nvim
				  lsp_doc_border = false, -- add a border to hover docs and signature help
			  },
		  })
	  end,
  },

  {
    "ThePrimeagen/harpoon",
	  branch = "harpoon2",
	  dependencies = { "nvim-lua/plenary.nvim" },
	  config = function()
		  local harpoon = require("harpoon")

		  -- REQUIRED
		  harpoon:setup()
		  -- REQUIRED

		  vim.keymap.set("n", "<leader>a", function()
			  harpoon:list():add()
		  end)
		  vim.keymap.set("n", "<C-e>", function()
			  harpoon.ui:toggle_quick_menu(harpoon:list())
		  end)

		  -- Toggle previous & next buffers stored within Harpoon list
		  vim.keymap.set("n", "<C-S-PageDown>", function()
			  harpoon:list():prev()
		  end)
		  vim.keymap.set("n", "<C-S-PageUp>", function()
			  harpoon:list():next()
		  end)
	  end,
  },

  {
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      end
    },
    {
      "nvim-telescope/telescope-ui-select.nvim",
      config = function()
        require("telescope").setup({
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {
                -- even more opts
              }
            }
          }
        })
        require("telescope").load_extension("ui-select")
      end
    },
  },
}
