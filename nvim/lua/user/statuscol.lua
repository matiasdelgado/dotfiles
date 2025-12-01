local builtin = require("statuscol.builtin")

require("statuscol").setup({
  setopt = true,
  ft_ignore = { "oil" },

  segments = {
    -- 🔹 Unified sign column (diagnostics + git signs + everything else)
    {
      sign = {
        name = { "Diagnostic.*", "GitSigns.*", ".*" }, -- order matters
        namespace = { ".*" },
        maxwidth = 1,
        colwidth = 1,
        auto = true,
      },
      click = "v:lua.ScSa",
    },

    -- 🔹 Line numbers
    {
      text = { builtin.lnumfunc, " " },
      condition = { builtin.not_empty },
      click = "v:lua.ScLa",
    },

    -- 🔹 Fold column
    {
      text = { builtin.foldfunc },
      click = "v:lua.ScFa",
    },
  },
})

