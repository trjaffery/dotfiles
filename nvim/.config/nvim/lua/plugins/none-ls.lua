return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formatters
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "javascript", "typescript", "html", "css", "json", "yaml", "markdown", "graphql", "liquid" },
        }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.clang_format,
      },  -- <-- Add this comma here

      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gf", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
        end
      end,
    })
    
    vim.keymap.set("n", "<leader>gf", function() vim.lsp.buf.format() end, { desc = "Format file with null-ls" })
  end,
}
