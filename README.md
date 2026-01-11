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

### Install Config

**macOS / Linux / WSL**
```bash
git clone https://github.com/vinceruizz/Neovim-Config.git
cd Neovim-Config
./install.sh
```

**Windows (Git Bash)**
```bash
git clone https://github.com/vinceruizz/Neovim-Config.git
cd Neovim-Config
./install.sh
```

**Manual Installation**
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# macOS / Linux
git clone https://github.com/vinceruizz/Neovim-Config.git ~/.config/nvim

# Windows (PowerShell)
git clone https://github.com/vinceruizz/Neovim-Config.git $env:LOCALAPPDATA\nvim
```

### Post-Installation

1. Open Neovim: `nvim`
2. Wait for plugins to install automatically
3. Run `:Mason` to install LSP servers and debug adapters

## Keybindings

### General

| Key | Action |
|-----|--------|
| `Space` | Leader key |
| `<leader>e` | File explorer |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>bb` | Switch buffer |

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
