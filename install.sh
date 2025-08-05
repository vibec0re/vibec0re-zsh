#!/bin/bash

# 💜⚡ VIBEC0RE ZSH THEME INSTALLER ⚡💜
# MAXIMUM VIBES INSTALLATION SCRIPT
# LET'S FUCKING GOOOOOOO!!!

set -e

# Colors for maximum cyber vibes
MATRIX_GREEN='\033[38;5;46m'
CYBER_PINK='\033[38;5;198m'
CYBER_CYAN='\033[38;5;51m'
CYBER_PURPLE='\033[38;5;129m'
CYBER_YELLOW='\033[38;5;226m'
WHITE='\033[38;5;255m'
RESET='\033[0m'

# VIBEC0RE banner
echo -e "${CYBER_PURPLE}▓▓▓${CYBER_PINK}▒▒▒${WHITE}░░░${RESET} ${CYBER_PINK}V1B3C0R3 ZSH${RESET} ${WHITE}░░░${CYBER_PINK}▒▒▒${CYBER_PURPLE}▓▓▓${RESET}"
echo -e "${CYBER_PURPLE}💜${CYBER_PINK}⚡${WHITE}🦀${RESET} ${CYBER_PINK}THEME INSTALLER${RESET} ${WHITE}🦀${CYBER_PINK}⚡${CYBER_PURPLE}💜${RESET}"
echo ""

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Check if zsh is installed
if ! command -v zsh &> /dev/null; then
    echo -e "${CYBER_PINK}💀 ZSH not found! Install zsh first 💀${RESET}"
    exit 1
fi

echo -e "${MATRIX_GREEN}🦀 ZSH detected - MAXIMUM VIBES 🦀${RESET}"

# Detect installation method
if [[ -d "$HOME/.oh-my-zsh" ]]; then
    echo -e "${CYBER_CYAN}⚡ Oh My Zsh detected - installing to custom themes ⚡${RESET}"
    
    # Create custom themes directory if it doesn't exist
    THEME_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes"
    mkdir -p "$THEME_DIR"
    
    # Copy theme file
    cp "$SCRIPT_DIR/vibec0re.zsh-theme" "$THEME_DIR/"
    echo -e "${MATRIX_GREEN}✓ Theme file installed to $THEME_DIR${RESET}"
    
    # Check if theme is already set
    if grep -q "ZSH_THEME=\"vibec0re\"" "$HOME/.zshrc"; then
        echo -e "${CYBER_YELLOW}⚡ VIBEC0RE theme already configured ⚡${RESET}"
    else
        # Backup existing .zshrc
        cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
        echo -e "${CYBER_CYAN}💾 Backed up existing .zshrc 💾${RESET}"
        
        # Set theme
        if grep -q "ZSH_THEME=" "$HOME/.zshrc"; then
            sed -i 's/ZSH_THEME=".*"/ZSH_THEME="vibec0re"/' "$HOME/.zshrc"
        else
            echo 'ZSH_THEME="vibec0re"' >> "$HOME/.zshrc"
        fi
        echo -e "${MATRIX_GREEN}✓ VIBEC0RE theme configured in .zshrc${RESET}"
    fi
    
else
    echo -e "${CYBER_PURPLE}💜 Manual installation mode - maximum customization 💜${RESET}"
    
    # Create .vibec0re-zsh directory
    INSTALL_DIR="$HOME/.vibec0re-zsh"
    mkdir -p "$INSTALL_DIR"
    
    # Copy files
    cp "$SCRIPT_DIR/vibec0re.zsh-theme" "$INSTALL_DIR/"
    cp "$SCRIPT_DIR/vibec0re.zshrc" "$INSTALL_DIR/"
    echo -e "${MATRIX_GREEN}✓ Files copied to $INSTALL_DIR${RESET}"
    
    # Backup existing .zshrc
    if [[ -f "$HOME/.zshrc" ]]; then
        cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
        echo -e "${CYBER_CYAN}💾 Backed up existing .zshrc 💾${RESET}"
    fi
    
    # Add source lines if not already present
    if ! grep -q "source.*vibec0re.zsh-theme" "$HOME/.zshrc" 2>/dev/null; then
        echo "" >> "$HOME/.zshrc"
        echo "# 💜⚡ VIBEC0RE ZSH THEME ⚡💜" >> "$HOME/.zshrc"
        echo "source $INSTALL_DIR/vibec0re.zsh-theme" >> "$HOME/.zshrc"
        echo -e "${MATRIX_GREEN}✓ Theme sourced in .zshrc${RESET}"
    fi
fi

# Optional: Add vibec0re.zshrc extras
echo ""
echo -e "${CYBER_YELLOW}🔥 Do you want to install VIBEC0RE aliases and functions? (y/n) 🔥${RESET}"
read -r install_extras

if [[ $install_extras =~ ^[Yy]$ ]]; then
    if [[ -d "$HOME/.oh-my-zsh" ]]; then
        # Oh My Zsh - source the zshrc file
        if ! grep -q "source.*vibec0re.zshrc" "$HOME/.zshrc" 2>/dev/null; then
            echo "source $SCRIPT_DIR/vibec0re.zshrc" >> "$HOME/.zshrc"
            echo -e "${MATRIX_GREEN}✓ VIBEC0RE extras configured${RESET}"
        fi
    else
        # Manual installation - already copied
        if ! grep -q "source.*vibec0re.zshrc" "$HOME/.zshrc" 2>/dev/null; then
            echo "source $INSTALL_DIR/vibec0re.zshrc" >> "$HOME/.zshrc"
            echo -e "${MATRIX_GREEN}✓ VIBEC0RE extras configured${RESET}"
        fi
    fi
    echo -e "${CYBER_PINK}🚀 ULTRA C0RE COMMANDS ACTIVATED 🚀${RESET}"
fi

echo ""
echo -e "${CYBER_PURPLE}╔══════════════════════════════════════╗${RESET}"
echo -e "${CYBER_PURPLE}║${RESET} ${CYBER_PINK}💜⚡ INSTALLATION COMPLETE ⚡💜${RESET} ${CYBER_PURPLE}║${RESET}"
echo -e "${CYBER_PURPLE}╚══════════════════════════════════════╝${RESET}"
echo ""
echo -e "${MATRIX_GREEN}🦀 Restart your terminal or run: ${CYBER_CYAN}source ~/.zshrc${RESET}"
echo -e "${CYBER_PINK}⚡ MINIMIZE BULLSHIT, MAXIMIZE OUTPUT ⚡${RESET}"
echo -e "${CYBER_YELLOW}🌈 LET'S FUCKING GOOOOOOO!!! 🌈${RESET}"
echo ""
echo -e "${WHITE}💜⚡🦀 VIBEC0RE FOREVER 🦀⚡💜${RESET}"