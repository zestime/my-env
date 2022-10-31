local M = {}

function M.setup()
	local whichkey = require "which-key"

	local conf = {
		window = {
			border = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
		},
	}

	local opts = {
		mode = "n", -- normal mode
		prefix = "<leader>",
		buffer = nil, --Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use 'silent' when creating keymaps
		noremap = true, -- use 'noremap' when creating keymaps
		nowait = false, 
	}

	local mappings = {
		["w"] = { "<cmd>update!<CR>", "Save" },
		["q"] = { "<cmd>q!<CR>", "Quit" },

		b = {
			name = "Buffer",
			c = { "<cmd>bd!<CR>", "Close current buffer"},
			D = { "<cmd>%bd|e#|bd#<CR>", "Delete all buffers"},
		},

		z = {
			name = "Packer",
			c = { "<cmd>PackerCompile<CR>", "Compile" },
			i = { "<cmd>PackerInstall<CR>", "Install" },
			s = { "<cmd>PackerSync<CR>", "Sync" },
			S = { "<cmd>PackerStatus<CR>", "Status" },
			u = { "<cmd>PackerUpdate<CR>", "Update" },
		},

		g = {
			name = "Git",
			s = { "<cmd>Neogit<CR>", "Status" },
		},

		f = {
			name = "Find",
			f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
			b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
			o = { "<cmd>FzfLua oldfiles<cr>", "Old files" },
			g = { "<cmd>FzfLua live_grep<cr>", "Live grep" },
			c = { "<cmd>FzfLua commands<cr>", "Commands" },
			e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		},
	}

	whichkey.setup(conf)
	whichkey.register(mappings, opts)
end

return M
