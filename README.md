# Meru Cozy Dotfiles

Warm Hyprland rice with a dark wine base, amber glow, muted cream text, and teal/blue accents. This repo contains my daily desktop configuration for Hyprland, Waybar, Rofi, Dunst, Kitty, Neovim, Starship, Fastfetch, btop, and Vencord/Vesktop.

![Meru Cozy wallpaper](./file_0000000098c0720e927af9409863f54e.png)

## Palette

| Role           | Hex       |
| -------------- | --------- |
| Background     | `#1a0e10` |
| Surface        | `#2b1518` |
| Raised surface | `#4a2428` |
| Text           | `#e8dcd0` |
| Muted text     | `#a89080` |
| Amber          | `#c56d3a` |
| Amber glow     | `#e8a04a` |
| Crimson        | `#843727` |
| Bright red     | `#c53a3a` |
| Teal           | `#0b596c` |
| Blue           | `#3c608b` |

## Included

- Hyprland compositor config
- Hyprpaper wallpaper config
- Hyprlock and Hypridle
- Waybar config and CSS
- Rofi launcher and power menu theme
- Dunst notifications
- Kitty terminal theme
- Neovim config with LazyVim and a matching Meru Cozy colorscheme
- Starship prompt
- Fastfetch config
- btop theme
- Vencord/Vesktop Discord theme
- Install and deploy scripts

## Requirements

This setup is written for an Arch-based system with `yay`.

The installer expects:

- `hyprland`
- `xdg-desktop-portal-hyprland`
- `hyprpaper`
- `hyprlock`
- `hypridle`
- `waybar`
- `rofi-wayland`
- `dunst`
- `kitty`
- `neovim`
- `starship`
- `fastfetch`
- `btop`
- `grim`
- `slurp`
- `wl-clipboard`
- `brightnessctl`
- `playerctl`
- `polkit-kde-agent`
- `nm-applet`
- `cliphist`
- `wtype`
- `ttf-jetbrains-mono-nerd`
- `otf-font-awesome`

## Install

Clone the repo:

```bash
git clone https://github.com/ArielNya/dotfiles.git
cd dotfiles
```

Install packages:

```bash
./install.sh
```

Deploy the configs:

```bash
./deploy.sh
```

The deploy script creates a timestamped backup at:

```text
~/.config-backup-YYYYMMDD_HHMMSS
```

Then it installs configs into:

```text
~/.config/hypr
~/.config/waybar
~/.config/rofi
~/.config/dunst
~/.config/kitty
~/.config/nvim
~/.config/fastfetch
~/.config/btop/themes
~/.config/Vencord/themes
~/.config/vesktop/themes
~/.config/starship.toml
```

After deployment, log out and select Hyprland from your display manager.

## Vencord / Vesktop

The Discord theme is installed to both common Linux theme paths:

```text
~/.config/Vencord/themes/MeruCozy.css
~/.config/vesktop/themes/MeruCozy.css
```

Enable `Meru Cozy` in Vencord or Vesktop settings. If Discord is already open, toggle the theme off and on or restart the client.

## Neovim

The Neovim config lives in `config/neovim` and deploys to:

```text
~/.config/nvim
```

It includes a LazyVim setup, plugin specs, editor options, keymaps, and a native `meru-cozy` colorscheme:

```text
colors/meru-cozy.lua
lua/meru-cozy/init.lua
lua/plugins/colorscheme.lua
```

Open Neovim after deployment and let Lazy install/sync plugins on first launch.

## btop

The btop theme is deployed to:

```text
~/.config/btop/themes/MeruCozy.theme
```

Set this in `~/.config/btop/btop.conf`:

```text
color_theme = "/home/ariel/.config/btop/themes/MeruCozy.theme"
```

Change `/home/ariel` if your home path is different.

## Structure

```text
.
├── config
│   ├── btop/themes/MeruCozy.theme
│   ├── dunst/dunstrc
│   ├── fastfetch/config.jsonc
│   ├── hypr
│   │   ├── hypridle.conf
│   │   ├── hyprland.conf
│   │   ├── hyprlock.conf
│   │   └── hyprpaper.conf
│   ├── kitty/kitty.conf
│   ├── neovim
│   │   ├── colors/meru-cozy.lua
│   │   ├── init.lua
│   │   ├── lazy-lock.json
│   │   ├── lazyvim.json
│   │   └── lua
│   ├── rofi
│   │   ├── meru-cozy.rasi
│   │   └── power-menu.sh
│   ├── starship.toml
│   ├── vencord/themes/MeruCozy.css
│   └── waybar
│       ├── config.jsonc
│       └── style.css
├── deploy.sh
├── install.sh
└── file_0000000098c0720e927af9409863f54e.png
```

## Notes

- The scripts are intentionally simple shell scripts, not a full dotfile manager.
- `deploy.sh` overwrites the target config files after making a backup.
- The wallpaper is copied to `~/.config/hypr/wallpaper.png`.
- The configs assume JetBrainsMono Nerd Font is available.
- Neovim plugins are managed by Lazy and are installed on first launch.

## License

Use, fork, and remix freely
