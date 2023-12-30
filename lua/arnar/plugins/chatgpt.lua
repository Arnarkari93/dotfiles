return {
  "jackMort/ChatGPT.nvim",
  config = function()
    require("chatgpt").setup({
      api_key_cmd = "lpass show --password 'chatgpt api key'",
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  }
}
