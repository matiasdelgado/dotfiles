require("neotest").setup({
  adapters = {
    require("neotest-dotnet")({
      dotnet_additional_args = {
        "--verbosity", "minimal",
      },
      discovery_root = "solution", -- important for backend/*.sln
    }),
  },
})
