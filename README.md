### Config structure
```
.
├── external/
│   ├── jails/
│   └── tree-sitter-jai/
├── init.lua
├── lazy-lock.json
├── lua/
│   └── plugins/
│       ├── lsp.lua
│       └── treesitter.lua
└── queries/
    └── jai/
        └── highlights.scm
```

### Usage
Clone the repository with --recursive. \
Ideally, you'd want to run this sepparately from your main config. To do that, you need to:
- on linux, store the config in `$HOME/.config/nvim-jai` and `export NVIM_APPNAME=nvim-jai`
- on windows, store the config in `%USERPROFILE%\\AppData\\local\\nvim-jai` and `set NVIM_APPNAME=nvim-jai`

