return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = {
            "--config",
            '{"config":{"MD013":false}}',
            "--",
          },
        },
      },
    },
  },
}
