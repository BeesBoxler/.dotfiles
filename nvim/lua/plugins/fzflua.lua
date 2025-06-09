return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Files dialog" },
		{ "<leader>gr", "<cmd>FzfLua live_grep<CR>", desc = "Ripgrep dialog" },
		{ "<leader>rr", "<cmd>FzfLua live_grep_resume<CR>", desc = "Ripgrep resume" },
	},
}
