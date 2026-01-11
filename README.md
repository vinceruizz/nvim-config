# Neovim Config

A feature-rich Neovim configuration built on **LazyVim** with full debugging support via DAP.

## Features

- LazyVim base configuration
- DAP debugging for Python, JavaScript/TypeScript, Go, C/C++/Rust
- Debug UI with breakpoints, step-through, variable inspection
- LSP support with auto-completion
- Treesitter syntax highlighting
- Snacks terminal integration
- Custom keymaps

## Installation

### Quick Install

```bash
bash <(curl -s https://raw.githubusercontent.com/vinceruizz/nvim-config/main/install.sh)
```

> **Warning**: This will overwrite your existing Neovim configuration and clear cache/data directories!

### Prerequisites

Install Neovim (0.9.0+ required):

**macOS**
```bash
brew install neovim
```

**Ubuntu/Debian**
```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update && sudo apt install neovim
```

**Arch Linux**
```bash
sudo pacman -S neovim
```

**Windows**
```powershell
winget install Neovim.Neovim
```
Or use Scoop:
```powershell
scoop install neovim
```

### Dependencies

Install recommended dependencies for full functionality:

**macOS**
```bash
brew install git node ripgrep fd
```

**Ubuntu/Debian**
```bash
sudo apt install git nodejs ripgrep fd-find
```

**Arch Linux**
```bash
sudo pacman -S git nodejs ripgrep fd
```

**Windows (Scoop)**
```powershell
scoop install git nodejs ripgrep fd
```

### Post-Installation

1. Open Neovim: `nvim`
2. Wait for plugins to install automatically
3. Run `:Mason` to install LSP servers and debug adapters

## Plugins

### Core

| Plugin | Description |
|--------|-------------|
| [folke/lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [LazyVim/LazyVim](https://github.com/LazyVim/LazyVim) | Base configuration with sensible defaults |

### Colorschemes

| Plugin | Description |
|--------|-------------|
| [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Clean dark theme (default) |
| [ellisonleao/gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Retro groove colorscheme |

### Completion & Snippets

| Plugin | Description |
|--------|-------------|
| [saghen/blink.cmp](https://github.com/saghen/blink.cmp) | Fast completion engine |
| [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet collection for many languages |
| [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |

### LSP & Formatting

| Plugin | Description |
|--------|-------------|
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration |
| [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/DAP/linter installer |
| [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | Code formatting |

### Debugging (DAP)

| Plugin | Description |
|--------|-------------|
| [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client |
| [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | UI for nvim-dap |
| [theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) | Virtual text showing variable values |
| [jay-babu/mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim) | Mason integration for DAP |
| [mfussenegger/nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python) | Python debugging |
| [leoluz/nvim-dap-go](https://github.com/leoluz/nvim-dap-go) | Go debugging |
| [nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio) | Async IO library for nvim-dap-ui |

### UI & Navigation

| Plugin | Description |
|--------|-------------|
| [folke/snacks.nvim](https://github.com/folke/snacks.nvim) | Terminal, file explorer, picker |
| [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |

### Syntax

| Plugin | Description |
|--------|-------------|
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and code understanding |

## Keybindings

### General

| Key | Action |
|-----|--------|
| `Space` | Leader key |
| `<leader>e` | File explorer |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>bb` | Switch buffer |
| `<leader>gg` | Lazygit |

### Terminal

| Key | Action |
|-----|--------|
| `<leader>tt` | Toggle terminal |
| `<leader>th` | Terminal horizontal split |
| `<leader>tv` | Terminal vertical split |

### Debugging

| Key | Action |
|-----|--------|
| `F5` | Start/Continue debugging |
| `F9` | Toggle breakpoint |
| `F10` | Step over |
| `F11` | Step into |
| `Shift+F11` | Step out |
| `<leader>du` | Toggle debug UI |
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dx` | Terminate session |
| `<leader>de` | Eval expression |
| `<leader>dr` | Toggle REPL |

## Debugging Support

Debug adapters are auto-installed via Mason:

| Language | Adapter |
|----------|---------|
| Python | debugpy |
| JavaScript/TypeScript | js-debug-adapter |
| Go | delve |
| C/C++/Rust | codelldb |

### Quick Start Debugging

1. Open a source file
2. Press `F9` on a line to set a breakpoint
3. Press `F5` to start debugging
4. Use `F10`/`F11` to step through code
5. Press `<leader>du` to toggle the debug UI

## Structure

```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── config/
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins/
│       ├── colorschemes.lua
│       ├── completions.lua
│       ├── debug.lua
│       ├── lsp.lua
│       ├── lualine.lua
│       ├── luasnip.lua
│       ├── snacks.lua
│       └── treesitter.lua
└── lazy-lock.json
```

## Customization

- **Add plugins**: Create a new file in `lua/plugins/`
- **Keymaps**: Edit `lua/config/keymaps.lua`
- **Options**: Edit `lua/config/options.lua`
- **LSP servers**: Edit `lua/plugins/lsp.lua`
