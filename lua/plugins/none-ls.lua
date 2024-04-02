return {
  "jose-elias-alvarez/null-ls.nvim",

  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      soruces = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.completion.spell,
      }
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end
}
