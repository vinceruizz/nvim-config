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

# Repository URL
REPO_URL="https://github.com/vinceruizz/nvim-config.git"
TMP_DIR="/tmp/nvim-config-install"

# Cleanup function
cleanup() {
    if [ -d "$TMP_DIR" ]; then
        info "Cleaning up temporary files..."
        rm -rf "$TMP_DIR"
    fi
}

# Set trap to cleanup on exit
trap cleanup EXIT

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

# Clone repository to temp directory
clone_repo() {
    info "Cloning repository to temporary directory..."

    # Remove existing temp directory if it exists
    if [ -d "$TMP_DIR" ]; then
        rm -rf "$TMP_DIR"
    fi

    git clone --depth 1 "$REPO_URL" "$TMP_DIR" || error "Failed to clone repository"
    info "Repository cloned successfully!"
}

# Warn and confirm overwrite
confirm_overwrite() {
    echo ""
    echo -e "${RED}=========================================${NC}"
    echo -e "${RED}  WARNING: This will OVERWRITE your${NC}"
    echo -e "${RED}  existing Neovim configuration!${NC}"
    echo -e "${RED}=========================================${NC}"
    echo ""

    if [ -e "$CONFIG_DIR" ]; then
        warn "Existing config found at: $CONFIG_DIR"
        echo "This directory will be DELETED and replaced."
        echo ""
    fi

    read -p "Are you sure you want to continue? [y/N] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        info "Installation cancelled."
        exit 0
    fi
}

# Install the config
install_config() {
    # Remove existing config directory if it exists
    if [ -e "$CONFIG_DIR" ]; then
        info "Removing existing config..."
        rm -rf "$CONFIG_DIR"
    fi

    # Also clean up Neovim cache and data directories for a fresh start
    info "Cleaning Neovim cache and data directories..."
    rm -rf "$HOME/.local/share/nvim"
    rm -rf "$HOME/.local/state/nvim"
    rm -rf "$HOME/.cache/nvim"

    # Create parent directory if needed
    mkdir -p "$(dirname "$CONFIG_DIR")"

    # Copy config files
    info "Installing config to $CONFIG_DIR..."
    cp -r "$TMP_DIR" "$CONFIG_DIR"

    # Remove git directory from the installed config
    rm -rf "$CONFIG_DIR/.git"

    info "Config installed successfully!"
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
    confirm_overwrite
    clone_repo
    install_config
    post_install
}

main
