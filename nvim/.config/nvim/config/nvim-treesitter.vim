lua <<EOF
require 'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "rust" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,  -- false will disable the whole extension
  },
  indent = {
      enable = true
  }
}
EOF
