return {
  {
    "sainnhe/gruvbox-material",  -- Correct plugin for Gruvbox Material
    lazy = false,
    name = "gruvbox-material",
    priority = 1000,
    config = function()
      -- Gruvbox Material setup with integrations and customization
      vim.g.gruvbox_material_background = 'medium'                -- Adjust the background brightness
      vim.g.gruvbox_material_transparent_background = 2            -- Set transparency level (1 to 3)

      -- Set the Gruvbox Material color scheme
      vim.cmd.colorscheme("gruvbox-material")

      -- Set Gruvbox as the theme for vim-airline
      vim.g.airline_theme = 'gruvbox_material'
      vim.g.airline_powerline_fonts = 1
    end,
  },
}
