#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Detect OS and set config directory
detect_os() {
    case "$(uname -s)" in
        Linux*)
            if [ -f /etc/os-release ]; then
                . /etc/os-release
                info "Detected Linux: $NAME"
                DISTRO=$ID
            else
                info "Detected Linux"
                DISTRO="linux"
            fi
            CONFIG_DIR="$HOME/.config/nvim"
            ;;
        Darwin*)
            info "Detected macOS"
            DISTRO="macos"
            CONFIG_DIR="$HOME/.config/nvim"
            ;;
        MINGW*|MSYS*|CYGWIN*)
            info "Detected Windows (Git Bash/MSYS)"
            DISTRO="windows"
            CONFIG_DIR="$LOCALAPPDATA/nvim"
            ;;
        *)
            # Check for WSL
            if grep -qi microsoft /proc/version 2>/dev/null; then
                info "Detected WSL"
                DISTRO="wsl"
                CONFIG_DIR="$HOME/.config/nvim"
            else
                error "Unsupported operating system: $(uname -s)"
            fi
            ;;
    esac
}

# Check if neovim is installed
check_neovim() {
    if command -v nvim &> /dev/null; then
        NVIM_VERSION=$(nvim --version | head -n1)
        info "Neovim is installed: $NVIM_VERSION"

        # Check version >= 0.9.0 (required for LazyVim)
        VERSION_NUM=$(echo "$NVIM_VERSION" | grep -oE '[0-9]+\.[0-9]+' | head -1)
        MAJOR=$(echo "$VERSION_NUM" | cut -d. -f1)
        MINOR=$(echo "$VERSION_NUM" | cut -d. -f2)

        if [ "$MAJOR" -lt 1 ] && [ "$MINOR" -lt 9 ]; then
            warn "Neovim 0.9.0+ is recommended for LazyVim. You have $VERSION_NUM"
        fi
    else
        warn "Neovim is not installed. Install it first:"
        case "$DISTRO" in
            ubuntu|debian)
                echo "  sudo apt install neovim"
                echo "  # Or for latest version:"
                echo "  sudo add-apt-repository ppa:neovim-ppa/unstable"
                echo "  sudo apt update && sudo apt install neovim"
                ;;
            arch|manjaro)
                echo "  sudo pacman -S neovim"
                ;;
            fedora)
                echo "  sudo dnf install neovim"
                ;;
            macos)
                echo "  brew install neovim"
                ;;
            windows)
                echo "  winget install Neovim.Neovim"
                echo "  # Or: scoop install neovim"
                ;;
            *)
                echo "  Visit: https://github.com/neovim/neovim/releases"
                ;;
        esac
        echo ""
        read -p "Continue anyway? [y/N] " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
}

# Check dependencies
check_dependencies() {
    echo ""
    info "Checking dependencies..."

    MISSING_DEPS=()

    # Git (required)
    if ! command -v git &> /dev/null; then
        MISSING_DEPS+=("git")
    fi

    # Node.js (for LSP servers)
    if ! command -v node &> /dev/null; then
        MISSING_DEPS+=("node")
    fi

    # ripgrep (for telescope)
    if ! command -v rg &> /dev/null; then
        MISSING_DEPS+=("ripgrep")
    fi

    # fd (for telescope)
    if ! command -v fd &> /dev/null; then
        MISSING_DEPS+=("fd")
    fi

    if [ ${#MISSING_DEPS[@]} -gt 0 ]; then
        warn "Missing optional dependencies: ${MISSING_DEPS[*]}"
        echo ""
        echo "Install them for full functionality:"
        case "$DISTRO" in
            ubuntu|debian)
                echo "  sudo apt install ${MISSING_DEPS[*]}"
                ;;
            arch|manjaro)
                echo "  sudo pacman -S ${MISSING_DEPS[*]}"
                ;;
            macos)
                echo "  brew install ${MISSING_DEPS[*]}"
                ;;
            windows)
                echo "  scoop install ${MISSING_DEPS[*]}"
                ;;
        esac
        echo ""
    else
        info "All dependencies satisfied!"
    fi
}

# Backup existing config
backup_config() {
    if [ -e "$CONFIG_DIR" ]; then
        BACKUP="$CONFIG_DIR.backup.$(date +%Y%m%d_%H%M%S)"
        warn "Existing config found. Backing up to: $BACKUP"
        mv "$CONFIG_DIR" "$BACKUP"
    fi
}

# Install the config
install_config() {
    echo ""
    echo "Installation method:"
    echo "  1) Symlink (recommended - stays in sync with repo)"
    echo "  2) Copy (standalone copy)"
    read -p "Choose [1/2]: " -n 1 -r
    echo

    # Ensure parent directory exists
    mkdir -p "$(dirname "$CONFIG_DIR")"

    case $REPLY in
        2)
            info "Copying config to $CONFIG_DIR"
            cp -r "$SCRIPT_DIR" "$CONFIG_DIR"
            # Remove git directory from copy
            rm -rf "$CONFIG_DIR/.git"
            info "Config copied successfully!"
            ;;
        *)
            info "Creating symlink to $CONFIG_DIR"
            ln -s "$SCRIPT_DIR" "$CONFIG_DIR"
            info "Symlink created successfully!"
            ;;
    esac
}

# Post-install info
post_install() {
    echo ""
    echo -e "${CYAN}=========================================${NC}"
    echo -e "${CYAN}  Installation Complete!${NC}"
    echo -e "${CYAN}=========================================${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Open neovim: nvim"
    echo "  2. Wait for plugins to install automatically"
    echo "  3. Run :Mason to install LSP servers and debug adapters"
    echo ""
    echo "Keybindings:"
    echo "  <leader> is Space"
    echo "  <leader>du  - Toggle debug UI"
    echo "  F5          - Start debugging"
    echo "  F9          - Toggle breakpoint"
    echo ""
}

# Main
main() {
    echo ""
    echo "========================================="
    echo "  Neovim Config Installer"
    echo "  LazyVim + DAP Debugging"
    echo "========================================="
    echo ""

    detect_os
    check_neovim
    check_dependencies
    backup_config
    install_config
    post_install
}

main
