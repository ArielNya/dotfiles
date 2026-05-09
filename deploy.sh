#!/bin/bash
# ═══════════════════════════════════════════════════════════════
#  🔥 Meru Cozy — Deploy Script
#  Backs up existing configs and deploys the rice
# ═══════════════════════════════════════════════════════════════

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SRC="$SCRIPT_DIR/config"
WALLPAPER_SRC="$SCRIPT_DIR/file_0000000098c0720e927af9409863f54e.png"
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d_%H%M%S)"
CONFIG_DIR="$HOME/.config"

echo "🔥 Meru Cozy — Deploying Hyprland Rice"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# ── Backup existing configs ──────────────────────────────────
echo "📦 Backing up existing configs to $BACKUP_DIR..."
mkdir -p "$BACKUP_DIR"

for dir in hypr waybar rofi dunst kitty btop fastfetch nvim Vencord vesktop; do
    if [ -d "$CONFIG_DIR/$dir" ]; then
        echo "   ↳ backing up $dir/"
        cp -r "$CONFIG_DIR/$dir" "$BACKUP_DIR/$dir"
    fi
done

# Backup starship separately
if [ -f "$CONFIG_DIR/starship.toml" ]; then
    echo "   ↳ backing up starship.toml"
    cp "$CONFIG_DIR/starship.toml" "$BACKUP_DIR/starship.toml"
fi

echo "   ✅ Backup complete!"
echo ""

# ── Create target directories ────────────────────────────────
echo "📁 Creating directories..."
mkdir -p "$CONFIG_DIR/hypr"
mkdir -p "$CONFIG_DIR/waybar"
mkdir -p "$CONFIG_DIR/rofi"
mkdir -p "$CONFIG_DIR/dunst"
mkdir -p "$CONFIG_DIR/kitty"
mkdir -p "$CONFIG_DIR/fastfetch"
mkdir -p "$CONFIG_DIR/nvim"
mkdir -p "$CONFIG_DIR/btop/themes"
mkdir -p "$CONFIG_DIR/Vencord/themes"
mkdir -p "$CONFIG_DIR/vesktop/themes"
mkdir -p "$HOME/Pictures/Screenshots"
echo "   ✅ Done!"
echo ""

# ── Copy wallpaper ───────────────────────────────────────────
echo "🖼️  Copying wallpaper..."
if [ -f "$WALLPAPER_SRC" ]; then
    cp "$WALLPAPER_SRC" "$CONFIG_DIR/hypr/wallpaper.png"
    echo "   ✅ Wallpaper → ~/.config/hypr/wallpaper.png"
else
    echo "   ⚠️  Wallpaper not found at $WALLPAPER_SRC"
    echo "   Please copy your wallpaper manually to ~/.config/hypr/wallpaper.png"
fi
echo ""

# ── Deploy Hyprland configs ─────────────────────────────────
echo "🖥️  Deploying Hyprland configs..."
cp "$CONFIG_SRC/hypr/hyprland.conf" "$CONFIG_DIR/hypr/hyprland.conf"
cp "$CONFIG_SRC/hypr/hyprpaper.conf" "$CONFIG_DIR/hypr/hyprpaper.conf"
cp "$CONFIG_SRC/hypr/hyprlock.conf" "$CONFIG_DIR/hypr/hyprlock.conf"
cp "$CONFIG_SRC/hypr/hypridle.conf" "$CONFIG_DIR/hypr/hypridle.conf"
echo "   ✅ hyprland.conf, hyprpaper.conf, hyprlock.conf, hypridle.conf"

# ── Deploy Waybar ────────────────────────────────────────────
echo "📊 Deploying Waybar..."
cp "$CONFIG_SRC/waybar/config.jsonc" "$CONFIG_DIR/waybar/config.jsonc"
cp "$CONFIG_SRC/waybar/style.css" "$CONFIG_DIR/waybar/style.css"
echo "   ✅ config.jsonc, style.css"

# ── Deploy Rofi ──────────────────────────────────────────────
echo "🔍 Deploying Rofi..."
cp "$CONFIG_SRC/rofi/meru-cozy.rasi" "$CONFIG_DIR/rofi/meru-cozy.rasi"
cp "$CONFIG_SRC/rofi/power-menu.sh" "$CONFIG_DIR/rofi/power-menu.sh"
chmod +x "$CONFIG_DIR/rofi/power-menu.sh"
echo "   ✅ meru-cozy.rasi, power-menu.sh"

# ── Deploy Dunst ─────────────────────────────────────────────
echo "🔔 Deploying Dunst..."
cp "$CONFIG_SRC/dunst/dunstrc" "$CONFIG_DIR/dunst/dunstrc"
echo "   ✅ dunstrc"

# ── Deploy Kitty ─────────────────────────────────────────────
echo "🐱 Deploying Kitty..."
cp "$CONFIG_SRC/kitty/kitty.conf" "$CONFIG_DIR/kitty/kitty.conf"
echo "   ✅ kitty.conf"

# ── Deploy Starship ──────────────────────────────────────────
echo "🚀 Deploying Starship..."
cp "$CONFIG_SRC/starship.toml" "$CONFIG_DIR/starship.toml"
echo "   ✅ starship.toml"

# ── Deploy Fastfetch ─────────────────────────────────────────
echo "⚡ Deploying Fastfetch..."
cp "$CONFIG_SRC/fastfetch/config.jsonc" "$CONFIG_DIR/fastfetch/config.jsonc"
echo "   ✅ config.jsonc (keeping existing tattoo.txt logo)"

# ── Deploy Neovim ────────────────────────────────────────────
echo "📝 Deploying Neovim..."
cp -r "$CONFIG_SRC/neovim/." "$CONFIG_DIR/nvim/"
echo "   ✅ LazyVim config → ~/.config/nvim"

# ── Deploy BTOP theme ────────────────────────────────────────
echo "📈 Deploying BTOP theme..."
cp "$CONFIG_SRC/btop/themes/MeruCozy.theme" "$CONFIG_DIR/btop/themes/MeruCozy.theme"
echo "   ✅ MeruCozy.theme"

# ── Deploy Vencord / Vesktop theme ────────────────────────────
echo "💬 Deploying Vencord theme..."
cp "$CONFIG_SRC/vencord/themes/MeruCozy.css" "$CONFIG_DIR/Vencord/themes/MeruCozy.css"
cp "$CONFIG_SRC/vencord/themes/MeruCozy.css" "$CONFIG_DIR/vesktop/themes/MeruCozy.css"
echo "   ✅ MeruCozy.css → Vencord and Vesktop themes"
echo ""

# ── Summary ──────────────────────────────────────────────────
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔥 Meru Cozy rice deployed!"
echo ""
echo "📋 Next steps:"
echo "   1. Install packages:  ./install.sh"
echo "   2. Log out of GNOME"
echo "   3. Select 'Hyprland' from your display manager"
echo "   4. Enjoy the cozy vibes~ 🐱"
echo ""
echo "📂 Backup location: $BACKUP_DIR"
echo ""
echo "💡 To switch BTOP theme, edit ~/.config/btop/btop.conf:"
echo '   color_theme = "/home/ariel/.config/btop/themes/MeruCozy.theme"'
echo ""
echo "✨ nya~"
