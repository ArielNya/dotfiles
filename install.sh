#!/bin/bash
# ═══════════════════════════════════════════════════════════════
#  Meru Cozy Hyprland Rice — Package Installer
#  Uses yay (AUR helper) on Nyarch Linux
# ═══════════════════════════════════════════════════════════════

set -e

echo "🔥 Installing Meru Cozy Hyprland Rice packages..."
echo ""

# ── Core Compositor ──────────────────────────────────────────
echo "📦 [1/6] Hyprland core..."
yay -S --needed --noconfirm \
    hyprland \
    xdg-desktop-portal-hyprland \
    hyprpaper \
    hyprlock \
    hypridle \
    hyprutils

# ── Status Bar ───────────────────────────────────────────────
echo "📦 [2/6] Waybar..."
yay -S --needed --noconfirm \
    waybar

# ── Launcher, Notifications & Editor ─────────────────────────
echo "📦 [3/6] Rofi, Dunst & Neovim..."
yay -S --needed --noconfirm \
    rofi-wayland \
    dunst \
    neovim

# ── Utilities ────────────────────────────────────────────────
echo "📦 [4/6] Utilities..."
yay -S --needed --noconfirm \
    grim \
    slurp \
    wl-clipboard \
    brightnessctl \
    playerctl \
    polkit-kde-agent \
    nm-applet

# ── Fonts (if missing) ──────────────────────────────────────
echo "📦 [5/6] Fonts..."
yay -S --needed --noconfirm \
    ttf-jetbrains-mono-nerd \
    otf-font-awesome

# ── Optional extras ─────────────────────────────────────────
echo "📦 [6/6] Extras..."
yay -S --needed --noconfirm \
    cliphist \
    wtype

echo ""
echo "✅ All packages installed!"
echo "🐱 Run ./deploy.sh next to deploy your configs."
