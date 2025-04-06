require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "anthropic"
    },
    inline = {
      adapter = "anthropic"
    }
  },
  adapters = {
    anthropic = function()
      return require("codecompanion.adapters").extend("anthropic", {
        env = {
          api_key = "cmd:op read op://personal/Anthropic/password --no-newline"
        }
      })
    end
  }
})
