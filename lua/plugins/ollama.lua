-- install ollama: https://ollama.com/
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
      "<leader>oR",
      ":<c-u>lua require('ollama').prompt('Raw')<cr>",
      desc = "ollama Raw Ask",
      mode = { "n", "v" },
    },
  },

  ---@type Ollama.Config
  opts = {
    model = "llama3",
    prompts = {
      Review = {
        prompt = "Please review the code:\n```$ftype\n$sel```",
        input_label = "Review > ",
        model = "codellama:34b",
        action = "display",
      },
      EnDict = {
        prompt = "Korean Dictionary(Simple Answer, just meaning): $sel",
        input_label = "EnDict > ",
        model = "llama3",
        action = "display",
      },
      TranslationIntoKorean = {
        prompt = "Please translate into Korean: $sel",
        input_label = "Translation > ",
        model = "llama3",
        action = "display",
      },
    },
  },
}
