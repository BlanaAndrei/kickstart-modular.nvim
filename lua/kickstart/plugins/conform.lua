return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gofumpt' },
        javascript = { 'eslint_d', 'prettierd' },
        typescript = { 'eslint_d', 'prettierd' },
        javascriptreact = { 'eslint_d', 'prettierd' },
        typescriptreact = { 'eslint_d', 'prettierd' },
        json = { 'prettierd' },
        yaml = { 'prettierd', 'prettier' },
        markdown = { 'prettierd', 'prettier' },
        css = { 'prettierd', 'prettier' },
        scss = { 'prettierd', 'prettier' },
        html = { 'prettierd', 'prettier' },
        python = { 'black' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
