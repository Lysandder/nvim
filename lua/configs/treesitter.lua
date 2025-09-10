local options = {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "csv",
    "dart",
    "html",
    "javascript",
    "json",
    "lua",
    "luadoc",
    "printf",
    "python",
    "sql",
    "toml",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
