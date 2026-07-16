local exclude_dirs = { "node_modules", ".git", ".idea", ".vscode", "dist", "build", ".next", ".nuxt", "coverage", ".DS_Store" }
local exclude_grep = { "node_modules", ".git", ".idea", ".vscode", "dist", "build", ".next", ".nuxt", "coverage", ".DS_Store", "*.lock", "package-lock.json", "yarn.lock", "pnpm-lock.yaml" }

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            exclude = exclude_dirs,
          },
          files = {
            hidden = true,
            ignored = true,
            exclude = exclude_dirs,
          },
          grep = {
            hidden = true,
            ignored = true,
            exclude = exclude_grep,
          }
        }
      }
    }
  }
}
