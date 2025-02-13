local options = {
  ensure_installed = {
    "bash",
    "lua",
    "luadoc",
    "printf",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
    "csv",
    "json",
    "sql",
    "c",
    "cpp",
    "dart",
    "python",
    "javascript",
    "typescript",
    "html",
    "css",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
