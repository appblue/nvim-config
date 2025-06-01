return {
  "nomnivore/ollama.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- All the user commands added by the plugin
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

  keys = {
    -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oo",
      ":<c-u>lua require('ollama').prompt()<cr>",
      desc = "ollama prompt",
      mode = { "n", "v" },
    },

    -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oG",
      ":<c-u>lua require('ollama').prompt('Generate_Code_No_Main')<cr>",
      desc = "ollama Generate Code",
      mode = { "n", "v" },
    },
    {
      "<leader>oS",
      -- ":lua print(require('ollama').status())<cr>",
      function()
        print(require("ollama").status())
      end,
      desc = "ollama Generate Code",
      mode = { "n", "v" },
    },
  },

  ---@type Ollama.Config
  opts = {
    -- your configuration overrides
    model = "phi4:latest",
    prompts = {
      Generate_Code_No_Main = {
        prompt = "Generate $ftype code without example usage and main function that does the following: $input\n\n"
          .. "Respond EXACTLY in this format:\n```$ftype\n<your code>\n```",
        input_label = "> ",
        action = "display_insert",
      },
      Generate_Description = {
        prompt = "Generate text with polished english language describing the issue/problem/statement: $input\n\n"
          .. "Respond EXACTLY in this format:\n```$ftype\n<your code>\n```",
        input_label = "> ",
        action = "display_insert",
      },
      Followup_Email = {
        prompt = "Write a follow-up to my email, taking into consideration following points: $input\n\n. Generate response according to the following instructions 1 - 3:\n\n"
          .. "1. Summarize the email body in 1-2 sentences.\n"
          .. "2. Summarize the key outcomes for followup,\n"
          .. "3. Always Format the response according to the specified: Example Format.\n\n"
          .. "Example Format:\n\n"
          .. "Summary: [Summary]\n\n"
          .. "Followup: [Followup]\n\n"
          .. "The email thread is below:\n\n"
          .. "$buf",
        input_label = "> ",
        action = "display_insert",
      },
    },
  },
}
