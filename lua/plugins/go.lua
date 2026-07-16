-- Go development overrides, layered on top of the LazyVim `lang.go` extra.
--
-- The extra itself is enabled via `:LazyExtras` (stored in lazyvim.json) and
-- already wires up: gopls (gofumpt + semantic tokens + staticcheck + analyses),
-- Treesitter, goimports formatting, nvim-dap-go (Delve) and neotest-golang.
-- Keep this file thin: only override what genuinely improves on the defaults.
return {
  -- Run Go tests with the race detector, no result caching, and a hard timeout.
  -- `-race`  surfaces data races at test time (a core Go best practice).
  -- `-count=1` disables the Go test cache so TDD never sees stale results.
  -- `-timeout=60s` prevents a wedged test from hanging the suite.
  -- Drop `-race` if your suite feels slow; raise the timeout for integration tests.
  {
    "nvim-neotest/neotest",
    optional = true,
    opts = {
      adapters = {
        ["neotest-golang"] = {
          go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
          dap_go_enabled = true, -- debug tests with nvim-dap-go (requires Delve)
        },
      },
    },
  },
  -- Pin golangci-lint to the Mason-managed binary instead of PATH resolution.
  -- A stale `~/go/bin/golangci-lint` (built with an older Go than the installed
  -- toolchain) shadows Mason's on $PATH and makes nvim-lint fail with:
  --   "can't load config: the Go language version ... is lower than the targeted
  --    Go version ...", exit code 3.
  -- Mason's copy tracks the current toolchain. Keep `:Mason` updated after Go bumps.
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        golangcilint = {
          cmd = vim.fn.stdpath("data") .. "/mason/bin/golangci-lint",
        },
      },
    },
  },

  -- Optional: group your own module's imports separately from third-party ones.
  -- Uncomment and set the prefix to your Go module path (e.g. "github.com/yourorg").
  -- {
  --   "stevearc/conform.nvim",
  --   optional = true,
  --   opts = {
  --     formatters = {
  --       goimports = { prepend_args = { "-local", "github.com/yourorg" } },
  --     },
  --   },
  -- },
}
