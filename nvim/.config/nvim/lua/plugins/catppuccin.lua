return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- Catppuccin setup with integrations and customization
			require("catppuccin").setup({
				flavour = "frappe", -- Change to "mocha" if you prefer
				transparent_background = true,
				styles = {
					functions = { "italic" },
					keywords = { "bold" },
				},
				integrations = {
					hop = true,
					mason = true,
					neotree = true,
					nvimtree = false,
					which_key = true,
					dashboard = false,
					dap = { enabled = true, enable_ui = true },
				},
				custom_highlights = function(colors)
					return {
						-- Customize specific highlight groups here
					}
				end,
			})

			-- Apply the Catppuccin color scheme
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
