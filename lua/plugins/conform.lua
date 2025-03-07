return {
  {
    "stevearc/conform.nvim",
    opts = {
      -- LazyVim will use these options when formatting with the conform.nvim formatter
      -- format = {
      --   timeout_ms = 3000,
      --   async = false, -- not recommended to change
      --   quiet = false, -- not recommended to change
      --   lsp_fallback = true, -- not recommended to change
      -- },
      -- Set this to change the default values when calling conform.format()
      -- This will also affect the default values for format_on_save/format_after_save
      -- default_format_opts = {
      --   lsp_format = "fallback",
      -- },
      -- -- If this is set, Conform will run the formatter on save.
      -- It will pass the table to conform.format().
      -- This can also be a function that returns the table.
      -- format_on_save = {
      --   -- I recommend these options. See :help conform.format for details.
      --   lsp_format = "fallback",
      --   timeout_ms = 3000,
      -- },
      -- If this is set, Conform will run the formatter asynchronously after save.
      -- It will pass the table to conform.format().
      -- This can also be a function that returns the table.
      -- format_after_save = {
      --   lsp_format = "fallback",
      -- },

      -- ---@type table<string, conform.FormatterUnit[]>
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        python = { "isort", "black" },
        sql = { "sql_formatter" },
      },
      -- The options you set here will be merged with the builtin formatters.
      -- You can also define any custom formatters here.
      formatters = {
        injected = { options = { ignore_errors = true } },
        --     -- # Example of using dprint only when a dprint.json file is present
        --     -- dprint = {
        --     --   condition = function(ctx)
        --     --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        --     --   end,
        --     -- },
        --     --
        --     -- # Example of using shfmt with extra args
        --     -- shfmt = {
        --     --   prepend_args = { "-i", "2", "-ci" },
        --     -- },
      },
    },
  },
}
