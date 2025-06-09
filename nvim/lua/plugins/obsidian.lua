return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ibhagwan/fzf-lua",
		},
		opts = {
			workspaces = {
				{
					name = "notes",
					path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes",
				},
			},

			completion = {
				blink = true,
			},

			templates = {
				folder = "templates",
			},

			daily_notes = {
				folder = "Dailies",
				date_format = "%Y-%m-%d",
				alias_format = "%B %-d, %Y",
				default_tags = { "Daily" },
				template = "Templates/daily.md",
			},
			picker = {
				name = "fzf-lua",
				note_mappings = {
					new = "<C-x>",
					insert_link = "<C-l>",
				},
				tag_mappings = {
					tag_note = "<C-x>",
					insert_tag = "<C-l>",
				},
			},
			attachments = {
				img_folder = "assets/imgs", -- This is the default

				---@return string
				img_name_func = function()
					return string.format("%s-", os.time())
				end,

				-- A function that determines the text to insert in the note when pasting an image.
				-- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
				-- This is the default implementation.
				---@param client obsidian.Client
				---@param path obsidian.Path the absolute path to the image file
				---@return string
				img_text_func = function(client, path)
					path = client:vault_relative_path(path) or path
					return string.format("![%s](%s)", path.name, path)
				end,
			},
			---@param title string|?
			---@return string
			note_id_func = function(title)
				-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
				-- In this case a note with the title 'My new note' will be given an ID that looks
				-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. "-" .. suffix
			end,
			mappings = {
				["gf"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
				["<leader>ch"] = {
					action = function()
						return require("obsidian").util.toggle_checkbox()
					end,
					opts = { buffer = true },
				},
				["<cr>"] = {
					action = function()
						return require("obsidian").util.smart_action()
					end,
					opts = { buffer = true, expr = true },
				},
			},
		},
	},
	{
		"hisbaan/dataview.nvim",
		-- only load dataview.nvim for files in your obsidian vault
		event = {
			"BufEnter /Users/beaboxler/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/**.md",
		},
		-- configuration here, see below for full configuration options
		opts = {
			vault_dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes",
			buffer_type = "float", -- float | split | vsplit | tab
		},
	},
}
